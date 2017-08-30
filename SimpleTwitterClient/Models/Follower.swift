//
//  Follower.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/29/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation


extension API {
    func getFollowers(userId:String,cursor:Int,callback:callback) {
        let urlRequest = try TwitterRouter.listFollowers(userId: userId, cursor: cursor).asURLRequest()
        self.requestJSON(request: urlRequest) { response in
            switch response {
                
            }
        }
    }
}
