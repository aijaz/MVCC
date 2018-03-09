//
//  DetailViewController.swift
//  MyConf
//
//  Created by Aijaz Ansari on 7/30/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var coordinator: SessionCoordinator?


    @IBOutlet var imageView: UIImageView!
    @IBOutlet var sessionNameLabel: UILabel!
    @IBOutlet var sessionDescriptionLabel: UILabel!
    @IBOutlet var speakerNameLabel: UILabel!
    @IBOutlet var bioButton: UIButton!

    func readyToPopulateViews() -> Bool {
        return (imageView != nil)
    }
    
    func populateSessionImage(_ imagePath: String?) {
        if let imagePath = imagePath {
            imageView.image = UIImage(named: imagePath)
        }
        else {
            imageView.image = nil
        }
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
    }

    func populateSessionName(_ sessionName: String?) {
        sessionNameLabel.text = sessionName
        bioButton.isHidden = (sessionName == nil)
    }

    func populateSessionDescription(_ sessionDescription: String?) {
        let desc = sessionDescription ?? "Session Details Coming Soon"
        let attrStr = NSMutableAttributedString(string: desc)
        let font = UIFont(name: "AvenirNext-Medium", size: 18)
        attrStr.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, attrStr.length))
        sessionDescriptionLabel.attributedText = attrStr
    }

    func populateSpeakerName(_ speakerName: String?) {
        speakerNameLabel.text = speakerName
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        coordinator?.prepare(for: segue, sender: sender)
    }

}


extension DetailViewController {
    func attach(coordinator: Coordinator) {
        self.coordinator = coordinator as? SessionCoordinator
    }
}


