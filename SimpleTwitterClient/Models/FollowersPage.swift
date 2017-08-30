//
//  Page.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/30/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class FollowersPage : Object,Mappable {
    dynamic var nextCursorString = ""
    dynamic var nextCursor = 0
    var followers = List<Follower>()
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        nextCursorString <- map["next_cursor_str"]
        nextCursor <- map["next_cursor"]
        followers <- (map["users"], ListTransform<Follower>())
    }
    
}
