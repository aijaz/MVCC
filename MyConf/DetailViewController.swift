//
//  DetailViewController.swift
//  MyConf
//
//  Created by Aijaz Ansari on 7/30/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet var imageView: UIImageView!
    @IBOutlet var sessionNameLabel: UILabel!
    @IBOutlet var sessionDescriptionLabel: UILabel!
    @IBOutlet var speakerNameLabel: UILabel!
    @IBOutlet var bioButton: UIButton!

    var session: Session! {
        didSet {
            configureView()
        }
    }


    func configureView() {
        // Update the user interface for the detail item.
        guard let session = session else {
            return 
        }
        if sessionNameLabel == nil {
            return
        }
        sessionNameLabel.text = session.title
        speakerNameLabel.text = session.speaker?.name
        if let imagePath = session.speaker?.imagePath {
            imageView.image = UIImage(named: imagePath)
        }
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true

        let desc = session.sessionDescription ?? "Session Details Coming Soon"
        let attrStr = NSMutableAttributedString(string: desc)
        let font = UIFont(name: "AvenirNext-Medium", size: 18)
        attrStr.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, attrStr.length))
        sessionDescriptionLabel.attributedText = attrStr

        bioButton.isHidden = (session.speaker == nil)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBio" {
            let dest = segue.destination as! SpeakerBioViewController
            dest.speaker = session.speaker
        }
    }

}

