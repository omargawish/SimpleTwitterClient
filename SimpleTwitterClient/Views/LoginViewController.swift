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
                    
                } else {
                    
                }
            }
        }.dispose(in: self.disposeBag)
        
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

    deinit {
        self.disposeBag.dispose()
    }
}
