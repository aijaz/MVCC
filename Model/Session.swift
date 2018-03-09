 //
//  Session.swift
//  MyConf
//
//  Created by Aijaz Ansari on 7/30/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import Foundation

class Session {
    private let id: String
    public private(set) var title: String?
    public private(set) var sessionDescription: String?
    public private(set) var startTime: Date
    public private(set) var endTime: Date
    public private(set) var speaker: Speaker?
    public private(set) var startDate: String

    static let dateFormatter: DateFormatter = {
        let d = DateFormatter()
        d.dateFormat = "yyyyMMddHHmm"
        return d
    }()
    static let sectionHeaderDateFormatter: DateFormatter = {
        let d = DateFormatter()
        d.dateFormat = "EE, MMM d hh:mm a"
        return d
    }()

    


    init(id: String, title: String? = "[NO TITLE YET]", sessionDescription: String? = "", startTime: Date, endTime: Date, startDate: String, speaker: Speaker?) {
        self.id = id
        self.title = title
        self.sessionDescription = sessionDescription
        self.startTime = startTime
        self.endTime = endTime
        self.speaker = speaker
        self.startDate = startDate
    }

    convenience init?(withId id: String) {
        if let dict = Database.object(fromCollection: "session", withId: id),
            let start = dict["start"],
            let end = dict["end"],
            let startTime = Session.dateFormatter.date(from: start),
            let endTime = Session.dateFormatter.date(from: end)
            {
                self.init(id: dict["id"]!
                    , title: dict["name"]
                    , sessionDescription: dict["desc"]
                    , startTime: startTime
                    , endTime: endTime
                    , startDate: Session.sectionHeaderDateFormatter.string(from: startTime)
                    , speaker: Speaker(withId: dict["speakerId"]))

                speaker?.addSession(self)


        }
        else {
            return nil
        }

    }

    static func allSessions() -> [Session] {
        if let allSessions = Database.allSessionIds() {
            var result = [Session]()
            for id in allSessions {
                result.append(Session(withId: id)!)
            }
            return result
        }
        return []
    }
}
