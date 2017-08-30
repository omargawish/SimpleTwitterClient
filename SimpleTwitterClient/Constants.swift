//
//  Constants.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/29/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation

class Constants {
    
    static let twitterAPIBaseURL = "https://api.twitter.com/1.1/"
    
    // MARK:- API
    struct API {
        static let message = "message"
        struct response {
            static let success = "success"
        }
        struct Auth {
            static let key = "key"
            static let user = "user"
            static let phoneNumber = "phone_number"
            static let code = "code"
        }
    }
    
    // MARK:- TwitterRouter
    struct TwitterRouter {
        static let listFollowers = "followers/list.json"
        static let listTweets = "statuses/user_timeline"
    }

}
