//
//  SpeakerLabelsViewController.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/10/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import UIKit

class SpeakerLabelsViewController: UIViewController {

    var coordinator: SpeakerLabelsCoordinator?

    @IBOutlet var speakerNameLabel: UILabel!
    @IBOutlet var twitterLabel: UILabel!
    @IBOutlet var websiteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readyToPopulateViews() -> Bool {
        return (speakerNameLabel != nil)
    }

    func populateSpeakerName(_ str: String) {
        speakerNameLabel.text = str
    }

    func populateTwitter(_ str: String) {
        twitterLabel.text = "@\(str)"
    }

    func populateWebsite(_ str: String) {
        websiteLabel.text = "https://\(str)"
    }

}

extension SpeakerLabelsViewController {
    func attach(coordinator: Coordinator) {
        self.coordinator = coordinator as? SpeakerLabelsCoordinator
    }
}
