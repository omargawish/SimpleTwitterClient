//
//  FollowerCollectionViewCell.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/31/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // cut the avatar corners
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width/2
        self.avatarImageView.layer.masksToBounds = true
    }
    
}
