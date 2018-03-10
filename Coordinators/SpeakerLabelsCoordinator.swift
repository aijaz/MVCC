//
//  SpeakerLabelsCoordinator.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/10/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import UIKit

class SpeakerLabelsCoordinator: NSObject, Coordinator {
    weak var viewController: SpeakerLabelsViewController?

    var speakerName: String! {
        didSet {
            configureView()
        }
    }
    var twitter: String! {
        didSet {
            configureView()
        }
    }
    var website: String! {
        didSet {
            configureView()
        }
    }

    func viewDidLoad() {
        configureView()
    }

    func configureView() {
        guard let speakerName = speakerName else { return }
        guard let viewController = viewController else { return }
        if !viewController.readyToPopulateViews() {
            return
        }
        viewController.populateSpeakerName(speakerName)
        viewController.populateTwitter(twitter)
        viewController.populateWebsite(website)
    }


}


extension SpeakerLabelsCoordinator {
    func attach(viewController: UIViewController) {
        self.viewController = viewController as? SpeakerLabelsViewController
        self.viewController?.attach(coordinator: self)
    }
}

