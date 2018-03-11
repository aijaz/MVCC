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

        NSLog("Refreshing view models \(allSessions.count)")

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
        NSLog("Refreshed view models sessions \(sessionTimeSlots.count) currentIndex = \(currentIndex)")
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sessionTimeSlots.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionTimeSlots[section].sessions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MasterTableViewCell
        let session = sessionTimeSlots[indexPath.section].sessions[indexPath.row]
        cell.populateWith(session: session)

        return cell
    }

}
