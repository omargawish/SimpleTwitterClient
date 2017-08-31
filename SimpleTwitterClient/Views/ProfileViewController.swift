//
//  ProfileViewController.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/30/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond
import MXParallaxHeader
import SVProgressHUD

class ProfileViewController: UIViewController {
    
    var viewModel:ProfileViewModel!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tweetsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpTheStikyHeader()
        
        SVProgressHUD.show()
        
        self.viewModel.tweets.bind(to: self.tweetsTableView) { [unowned self] array,indexPath,tableView in
            let cell = self.tweetsTableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.tweetTableViewCell.identifier, for: indexPath) as! TweetTableViewCell
            let tweet = array[indexPath.item]
            cell.tweetTextLabel.text = tweet.text
            return cell
            }.dispose(in: disposeBag)
        
        
        // observe/check the followers request success
        self.viewModel.success.observeNext { success in
            if success != nil {
                SVProgressHUD.dismiss()
            }
            }.dispose(in: self.disposeBag)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTheStikyHeader() {
        let header = FollowerHeader(frame: CGRect(x: 0, y: 0, width: self.tweetsTableView.frame.width, height: 200))
        if let follower = self.viewModel.follower.value {
            header.setFollower(follower)
            header.contentMode = .scaleAspectFill
            
            self.tweetsTableView.parallaxHeader.view = header
            self.tweetsTableView.parallaxHeader.height = 200
            self.tweetsTableView.parallaxHeader.mode = .fill
            self.tweetsTableView.parallaxHeader.minimumHeight = 20
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    deinit {
        self.disposeBag.dispose()
    }
    
}
