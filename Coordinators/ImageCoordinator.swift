//
//  ImageCoordinator.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/9/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//


import UIKit

class ImageCoordinator: NSObject, Coordinator {
    weak var viewController: ImageViewController?

    var speaker: Speaker! {
        didSet {
            configureView()
        }
    }

    func viewDidLoad() {
        configureView()
    }

    func configureView() {
        guard let speaker = speaker else { return }
        guard let viewController = viewController else { return }
        if !viewController.readyToPopulateViews() {
            return
        }
        viewController.populateSessionImage(speaker.imagePath)
    }


}


extension ImageCoordinator {
    func attach(viewController: UIViewController) {
        self.viewController = viewController as? ImageViewController
        self.viewController?.attach(coordinator: self)
    }
}
