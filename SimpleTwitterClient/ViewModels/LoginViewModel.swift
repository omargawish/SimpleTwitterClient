//
//  LoginViewModel.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/29/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond
import TwitterKit

class LoginViewModel {
    
    let disposeBag = DisposeBag()
    let success = Property<Bool?>(nil)
    
    init(loginSignal:Signal1<Void>) {
        loginSignal.observeNext { [unowned self] in
            
            self.loginWithTwitter()
            
        }.dispose(in: self.disposeBag)
    }
    
    func loginWithTwitter() {
        Twitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                self.success.next(true)
            } else {
                self.success.next(false)
            }
        })
    }
    
    
    deinit {
        self.disposeBag.dispose()
    }
}
