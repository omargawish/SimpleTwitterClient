//
//  FollowersViewController.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/30/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import UIKit
import TwitterKit

class FollowersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let userId = Twitter.sharedInstance().sessionStore.session()?.userID {
            API.shared.getFollowers(userId: userId, cursor: -1, completaionHandler: { response in
                switch response {
                case .sucess(let object):
                    print(object)
                case .error(let error):
                    print(error)
                }
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
