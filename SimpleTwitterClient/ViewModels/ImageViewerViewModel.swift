//
//  ImageViewerViewModel.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/31/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond

class ImageViewerViewModel {
    let disposeBag = DisposeBag()
    let imageUrl = Property<String?>(nil)
    
    init(imageUrl:String) {
        self.imageUrl.next(imageUrl)
    }
    
    deinit {
        self.disposeBag.dispose()
    }
}
