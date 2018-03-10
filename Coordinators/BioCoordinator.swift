//
//  BioCoordinator.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/9/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import UIKit

class BioCoordinator: NSObject, Coordinator {
    weak var viewController: SpeakerBioViewController?

    let imageCoordinator = ImageCoordinator()
    let speakerLabelsCoordinator = SpeakerLabelsCoordinator()

    var speaker: Speaker! {
        didSet {
            imageCoordinator.imagePath = speaker.imagePath
            speakerLabelsCoordinator.speakerName = speaker.name
            speakerLabelsCoordinator.twitter = speaker.twitterHandle
            speakerLabelsCoordinator.website = speaker.website
            configureView()
        }
    }

    func viewDidLoad() {
        configureView()
    }

    func configureView() {
        // nothing being done here.
        // The contained view controllers do all the heavy lifting
    }

    func registerImageViewController(_ vc: ImageViewController) {
        imageCoordinator.attach(viewController: vc)
        imageCoordinator.imagePath = speaker.imagePath
    }

    func registerLabelsViewController(_ vc: SpeakerLabelsViewController) {
        speakerLabelsCoordinator.attach(viewController: vc)
        speakerLabelsCoordinator.speakerName = speaker.name
        speakerLabelsCoordinator.twitter = speaker.twitterHandle
        speakerLabelsCoordinator.website = speaker.website
    }



}


extension BioCoordinator {
    func attach(viewController: UIViewController) {
        self.viewController = viewController as? SpeakerBioViewController
        self.viewController?.attach(coordinator: self)
    }
}

