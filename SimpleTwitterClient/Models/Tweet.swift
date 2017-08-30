//
//  Tweet.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/29/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm
import TwitterKit

class Tweet: Object,Mappable {
    dynamic var id = 0
    dynamic var text = ""
    
    override open static func primaryKey() -> String? {
        return "id"
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
    }
}


extension API {
    func getTweets(userId:String,completaionHandler:@escaping callback) {
        do {
            let urlRequest = try TwitterRouter.listTweets(userId: userId).asURLRequest()
            self.requestJSON(request: urlRequest) { response in
                switch response {
                case .sucess(let object):
                    if let object = object as? [[String:Any]]{
                        let tweetsArray = Array<Tweet>(JSONArray: object)
                        completaionHandler(.sucess(object: tweetsArray))
                    }
                case .error(let error):
                    completaionHandler(.error(error: error))
                }
            }
        } catch {
            completaionHandler(.error(error: APIError(errorCode: -1,errorMessage: R.string.localization.somethingWentWrong())))
        }
    }
}
