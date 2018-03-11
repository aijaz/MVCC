//
//  MasterTableViewCell.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/9/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func populateWith(session: Session) {

        let titleLabel = contentView.viewWithTag(1) as! UILabel
        let speakerLabel = contentView.viewWithTag(2) as! UILabel
        let imageView = contentView.viewWithTag(3) as! UIImageView
        imageView.layer.cornerRadius = (imageView.frame.size.height)/2
        imageView.clipsToBounds = true


        titleLabel.text = session.title
        speakerLabel.text = session.speaker?.name ?? ""
        if let imagePath = session.speaker?.imagePath {
            imageView.image = UIImage(named: imagePath)
        }
        else {
            imageView.image = nil
        }

        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 128/256.0, green: 200/256.0, blue: 193/256.0, alpha: 1.0)
        selectedBackgroundView = bgColorView
    }

}
