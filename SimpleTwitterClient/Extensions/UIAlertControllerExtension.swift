//
//  UIAlertControllerExtension.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/30/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import UIKit

extension UIAlertController {
    func showSimpleAlert(message:String,vc:UIViewController) {
        let alertView = UIAlertController(title: R.string.localization.simpleTwitterClient(), message:message , preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: R.string.localization.okay(), style: .default, handler: { action in
            alertView.dismiss(animated: true, completion: nil)
        }))
        vc.present(alertView, animated: true, completion: nil)
    }
}
