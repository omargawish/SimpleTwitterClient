//
//  FollowerHeader.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/29/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import UIKit
import SDWebImage

class FollowerHeader: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        self.view = Bundle.main.loadNibNamed(R.nib.followerHeader.name, owner: self, options: nil)?.first as! UIView
        self.addSubview(view)
        
        // cut the avatar corners
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width/2
        self.avatarImageView.layer.masksToBounds = true
    }
    
    func setFollower(_ follower:Follower) {
        self.avatarImageView.sd_setImage(with: URL(string:follower.avatar), placeholderImage: #imageLiteral(resourceName: "ProfilePricturePlaceholder"))
        self.headerImageView.sd_setImage(with: URL(string:follower.header), placeholderImage: #imageLiteral(resourceName: "HeaderPlaceholder"))
        self.nameLabel.text = follower.name
    }
}
