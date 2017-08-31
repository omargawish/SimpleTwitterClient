//
//  FollowersViewModel.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/30/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond
import TwitterKit

class FollowersViewModel {
    
    let disposeBag = DisposeBag()
    public let followers = MutableObservableArray<Follower>([])
    private var nextCursor = -1
    public let selectedRow = Property<Int?>(nil)
    public let loadMoreSignal = Property<Void?>(nil)
    public let refreshSignal = Property<Void?>(nil)
    public let success = Property<Bool?>(nil)
    
    
    
    init() {
        self.getFollowers()
        
        // load more
        self.loadMoreSignal.observeNext {[unowned self] loadMore in
            if loadMore != nil {
                self.getFollowers()
            }
            }.dispose(in: self.disposeBag)
        
        // refresh
        self.refreshSignal.observeNext {[unowned self] loadMore in
            if loadMore != nil {
                self.nextCursor = -1
                self.getFollowers()
            }
            }.dispose(in: self.disposeBag)
    }
    
    func getFollowers() {
        if let userId = Twitter.sharedInstance().sessionStore.session()?.userID {
            API.shared.getFollowers(userId: userId, cursor: nextCursor, completaionHandler: {[unowned self] response in
                switch response {
                case .sucess(let object):
                    self.success.next(true)
                    if let followers = object as? FollowersPage {
                        self.followers.insert(contentsOf: Array(followers.followers), at: self.followers.count)
                        self.nextCursor = followers.nextCursor
                    }
                case .error(let error):
                    print(error)
                    self.success.next(false)
                }
            })
        }
    }
    
    deinit {
        self.disposeBag.dispose()
    }
}
