//
//  SessionCoordinator.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/9/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import UIKit

class SessionCoordinator: NSObject, Coordinator {
    weak var viewController: DetailViewController?
    var bioCoordinator = BioCoordinator()

    var session: Session! {
        didSet {
            configureView()
        }
    }

    func viewDidLoad() {
        configureView()
    }

    func configureView() {
        guard let session = session else { return }
        guard let viewController = viewController else { return }

        if !viewController.readyToPopulateViews() {
            return
        }
        viewController.populateSessionName(session.title)
        viewController.populateSessionDescription(session.sessionDescription)
        viewController.populateSpeakerName(session.speaker?.name)
        viewController.populateSessionImage(session.speaker?.imagePath)
    }

    func handleBioTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SpeakerBio") as! SpeakerBioViewController
        viewController?.navigationController?.pushViewController(vc, animated: true)
        bioCoordinator.attach(viewController: vc)
        bioCoordinator.speaker = session.speaker
    }


}


extension SessionCoordinator {
    func attach(viewController: UIViewController) {
        self.viewController = viewController as? DetailViewController
        self.viewController?.attach(coordinator: self)
    }
}
