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

    var speaker: Speaker! {
        didSet {
            imageCoordinator.speaker = speaker

            configureView()
        }
    }

    func viewDidLoad() {
        configureView()
    }

    func configureView() {
        guard let speaker = speaker else { return }
        guard let viewController = viewController else { return }

    }

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedImage" {
            let dest = segue.destination as! ImageViewController
            imageCoordinator.attach(viewController: dest)
            imageCoordinator.speaker = speaker
        }
    }



}


extension BioCoordinator {
    func attach(viewController: UIViewController) {
        self.viewController = viewController as? SpeakerBioViewController
        self.viewController?.attach(coordinator: self)
    }
}

