//
//  FollowersViewController.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/30/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond
import SDWebImage
import SVProgressHUD

class FollowersViewController: UIViewController,UICollectionViewDelegateFlowLayout {

    var viewModel:FollowersViewModel!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addRefreshControl()
        SVProgressHUD.show()
        
        self.collectionView.delegate = self
        
        self.viewModel = FollowersViewModel()
        
        self.viewModel.followers.bind(to: self.collectionView) { [unowned self] array,indexPath,collectionView in
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.followerCollectionViewCell.identifier, for: indexPath) as! FollowerCollectionViewCell
            let follower = array[indexPath.item]
            cell.userNameLabel.text = follower.name
            cell.avatarImageView.sd_setImage(with: URL(string:follower.avatar), placeholderImage: #imageLiteral(resourceName: "ProfilePricturePlaceholder"))
            cell.bioLabel.text = follower.bio
            
            return cell
            }.dispose(in: disposeBag)
        
        self.viewModel.selectedRow.observeNext { [unowned self] row in
            if row != nil {
                self.performSegue(withIdentifier: R.segue.followersViewController.showProfileSegue.identifier, sender: self)
            }
            }.dispose(in: disposeBag)
        
        // did get followers list successfully
        self.viewModel.success.observeNext { success in
            if success != nil {
                self.refreshControl.endRefreshing()
                SVProgressHUD.dismiss()
            }
        }.dispose(in: self.disposeBag)
        
        // show progress animation on loadMore
        self.viewModel.loadMoreSignal.observeNext { loadMore in
            if loadMore != nil {
                SVProgressHUD.show()
            }
        }.dispose(in: self.disposeBag)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection view delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == self.viewModel.followers.count - 1 {
            self.viewModel.loadMoreSignal.next(())
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.selectedRow.next(indexPath.item)
    }

    // MARK: - Add pull for refresh
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshBarbershops), for: .valueChanged)
        self.collectionView.addSubview(refreshControl)
    }
    
    func refreshBarbershops() {
        self.viewModel.refreshSignal.next(())
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == R.segue.followersViewController.showProfileSegue.identifier {
            if let vc = segue.destination as? ProfileViewController
                , let selectedRow = self.viewModel.selectedRow.value {
                vc.viewModel = ProfileViewModel(follower: self.viewModel.followers[selectedRow])
            }
        }
    }
    

}
