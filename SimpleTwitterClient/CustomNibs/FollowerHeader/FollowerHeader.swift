//
//  FollowerHeader.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/29/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import UIKit

class FollowerHeader: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.view = Bundle.main.loadNibNamed(R.nib.followerHeader.name, owner: self, options: nil)?.first as! UIView
        self.addSubview(view)
        
    }
}
