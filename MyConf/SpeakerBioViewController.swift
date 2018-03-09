//
//  SpeakerBioViewController.swift
//  MyConf
//
//  Created by Aijaz Ansari on 8/6/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import UIKit

class SpeakerBioViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var speakerNameLabel: UILabel!
    @IBOutlet var twitterLabel: UILabel!
    @IBOutlet var webLabel: UILabel!
    @IBOutlet var sessionLabel: UILabel!
    @IBOutlet var speakerBioLabel: UILabel!

    var speaker: Speaker? {
        didSet {
            configureView()
        }
    }

    func configureView() {
        guard let _ = speakerNameLabel else { return }
        if let speaker = speaker {
            speakerNameLabel.text = speaker.name
            if let imagePath = speaker.imagePath {
                imageView.image = UIImage(named: imagePath)
            }
            imageView.layer.cornerRadius = imageView.frame.size.width/2
            imageView.clipsToBounds = true

            if let bio = speaker.bio {
                let attrStr = NSMutableAttributedString(string: bio)
                let font = UIFont(name: "AvenirNext-Medium", size: 18)
                attrStr.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, attrStr.length))
                speakerBioLabel.attributedText = attrStr
            }

            if let twitter = speaker.twitterHandle {
                twitterLabel.text = "@\(twitter)"
            }
            else {
                twitterLabel.removeFromSuperview()
            }

            if let website = speaker.website {
                webLabel.text = "http://\(website)"
            }
            else {
                webLabel.removeFromSuperview()
            }

            sessionLabel.text = speaker.firstSessionName()

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showBio" {
            let dest = segue.destination as! SpeakerBioViewController
            dest.speaker = speaker
        }
    }


}
