//
//  MasterDataSource.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/8/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import UIKit

// the data source contains ViewModels

class MasterDataSource: NSObject, UITableViewDataSource {
    var sessionTimeSlots = [SectionItem]()

    func refreshViewModels() {
        let allSessions = Session.allSessions()
        var currentIndex = -1
        var lastDateSeen = ""
        sessionTimeSlots.removeAll(keepingCapacity: true)

        for session in allSessions {
            let sessionDate = session.startDate
            if sessionDate != lastDateSeen {
                lastDateSeen = sessionDate
                currentIndex += 1
                let sessionArray = [Session]()
                sessionTimeSlots.append(SectionItem(startTime: sessionDate, sessions: sessionArray))
            }
            sessionTimeSlots[currentIndex].sessions.append(session)
        }
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sessionTimeSlots.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionTimeSlots[section].sessions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Give the VM to the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let session = sessionTimeSlots[indexPath.section].sessions[indexPath.row]


        let titleLabel = cell.contentView.viewWithTag(1) as! UILabel
        let speakerLabel = cell.contentView.viewWithTag(2) as! UILabel
        let imageView = cell.contentView.viewWithTag(3) as! UIImageView
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
        bgColorView.backgroundColor = UIColor(colorLiteralRed: 200/256.0, green: 200/256.0, blue: 193/256.0, alpha: 1.0)
        cell.selectedBackgroundView = bgColorView

        return cell
    }


}
