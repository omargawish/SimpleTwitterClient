//
//  ImageViewerViewController.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/31/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond
import SDWebImage

class ImageViewerViewController: UIViewController {
    
    var viewModel:ImageViewerViewModel!
    let disposeBag = DisposeBag()

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        // add tap gesture to image
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.touchOutsideTheImage)))
        // observe image url property
        self.viewModel.imageUrl.observeNext {[unowned self] url in
            self.imageView.sd_setImage(with: URL(string: url!)!)
        }.dispose(in: self.disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Tap Gesture Recognizer
    func touchOutsideTheImage() {
        self.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        self.disposeBag.dispose()
    }

}
