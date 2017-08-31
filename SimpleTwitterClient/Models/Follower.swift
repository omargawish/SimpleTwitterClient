//
//  Follower.swift
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

class Follower: Object,Mappable {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var bio = ""
    dynamic var avatar = ""
    dynamic var header = ""
    
    override open static func primaryKey() -> String? {
        return "id"
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["screen_name"]
        header <- map["profile_background_image_url_https"]
        avatar <- map["profile_image_url_https"]
        bio <- map["description"]
    }
    
    // MARK:- CRUD
    func save() {
        let realm = try! Realm()
        try! realm.write {
            realm.add(self, update: true)
        }
    }
}


extension API {
    func getFollowers(userId:String,cursor:Int,completaionHandler:@escaping callback) {
        do {
            let urlRequest = try TwitterRouter.listFollowers(userId: userId, cursor: cursor).asURLRequest()
            self.requestJSON(request: urlRequest) { response in
                switch response {
                case .sucess(let object):
                    if let object = object as? [String:Any]{
                        if let followersPage = FollowersPage(JSON: object) {
                            // cache result in database for offline mode
                            for follower in followersPage.followers {
                                follower.save()
                            }
                            completaionHandler(.sucess(object: followersPage))
                        }
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
