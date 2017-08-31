//
//  LoginViewController.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/29/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import UIKit
import TwitterKit
import ReactiveKit
import Bond

class LoginViewController: UIViewController {
    
    var viewModel:LoginViewModel!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var loginButton: TWTRLogInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize the view model
        self.viewModel = LoginViewModel(loginSignal: self.loginButton.reactive.tap)
        
        // observe the login success signal
        self.viewModel.success.observeNext { success in
            if let success = success {
                if success {
                    self.performSegue(withIdentifier: R.segue.loginViewController.showUserFollowersSegue.identifier, sender: self)
                } else {
                    UIAlertController().showSimpleAlert(message: R.string.localization.somethingWentWrong(), vc: self)
                }
            }
            }.dispose(in: self.disposeBag)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // transit to next followers view controller if user already logged in
        self.viewModel.AlreadyLoggedIn.observeNext { loggedIn in
            if let loggedIn = loggedIn {
                if loggedIn {
                    self.performSegue(withIdentifier: R.segue.loginViewController.showUserFollowersSegue.identifier, sender: self)
                }
            }
            }.dispose(in: self.disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        self.disposeBag.dispose()
    }
}
