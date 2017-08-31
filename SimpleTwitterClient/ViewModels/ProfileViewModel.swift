//
//  ProfileViewModel.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/30/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond
import TwitterKit

class ProfileViewModel {
    let disposeBag = DisposeBag()
    public let follower = Property<Follower?>(nil)
    public let tweets = MutableObservableArray<Tweet>([])
    public let success = Property<Bool?>(nil)
    
    init(follower:Follower) {
        self.getTweets(userId: String(follower.id))
        self.follower.next(follower)
    }
    
    func getTweets(userId:String) {
        API.shared.getTweets(userId: userId, completaionHandler: {[unowned self] response in
            switch response {
            case .sucess(let object):
                self.success.next(true)
                if let tweets = object as? [Tweet] {
                    self.tweets.insert(contentsOf: tweets, at: 0)
                }
            case .error(let error):
                self.success.next(false)
                print(error)
            }
        })
    }
    
    deinit {
        self.disposeBag.dispose()
    }
}
