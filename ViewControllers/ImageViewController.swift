//
//  ImageViewController.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/9/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var coordinator: ImageCoordinator?

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        coordinator?.viewDidLoad()
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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



}


extension ImageViewController {
    func attach(coordinator: Coordinator) {
        self.coordinator = coordinator as? ImageCoordinator
    }
}
