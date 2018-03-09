//
//  Database.swift
//  MyConf
//
//  Created by Aijaz Ansari on 8/4/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import Foundation


struct Database {
    static var jsonData: Any!
    typealias StrDict = [String: String]

    static let dateFormatter:DateFormatter = {
        let d = DateFormatter()
        d.dateFormat = "yyyyMMddHHmm"
        d.doesRelativeDateFormatting = true
        d.dateStyle = .short
        d.timeStyle = .medium
        return d
    }()

    static func allSessionIds() -> [String]? {
        guard let jsonData = jsonData as? [String: Any] else {
            return nil
        }
        let sessions = jsonData["sessions"] as! [[String: String]]
        return sessions.reduce([String](), {
            var running = $0
            running.append($1["id"]!)
            return running
        })
    }


//    static func allSessions() -> [StrDict]? {
//        guard let jsonData = jsonData as? [String: Any] else {
//            return nil
//        }
//        let sessions = jsonData["sessions"] as! [[String: String]]
//        let speakers = jsonData["speakers"] as! [StrDict]
//
//        var speakersById = speakers.reduce([String: StrDict]()) {
//            if let id = $1["id"] {
//                var running = $0
//                running[id] = $1
//                return running
//            }
//            return $0
//        }
//
//        var result = [StrDict]()
//
//        for session in sessions {
//            var resultDict = [String: String]()
//
//            resultDict["session_name"] = session["title"]
//            resultDict["session_id"] = session["id"]
//            if let start = session["start"] { resultDict["start"] = start }
//            if let end = session["end"] { resultDict["end"] = end }
//            if let speakerId = session["speakerId"],
//                let speaker = speakersById[speakerId] {
//                resultDict["speaker_name"] = speaker["name"]
//                resultDict["speaker_image"] = speaker["img"]
//            }
//
//            result.append(resultDict)
//        }
//        return result
//    }

    static func object(fromCollection type: String, withId id: String) -> StrDict? {
        guard let jsonData = jsonData as? [String: Any] else {
            return nil
        }
        if type == "speaker" {
            let speakers = jsonData["speakers"] as! [StrDict]

            var speakersById = [String: StrDict]()
            for speaker in speakers {
                speakersById[speaker["id"]!] = speaker
            }
            if let speaker = speakersById[id] {
                var result = StrDict()
                if let sid = speaker["id"] { result["id"] = sid }
                if let name = speaker["name"] { result["name"] = name }
                if let image = speaker["img"] { result["img"] = image }
                if let twitter = speaker["twitter"] { result["twitter"] = twitter }
                if let website = speaker["website"] { result["website"] = website }
                if let bio = speaker["bio"] { result["bio"] = bio }
                return result
            }
        }
        else if type == "session" {
            let sessions = jsonData["sessions"] as! [StrDict]

            var sessionsById = [String: [String: String]]()
            for session in sessions {
                sessionsById[session["id"]!] = session
            }
            if let session = sessionsById[id] {
                var result = StrDict()
                if let sid = session["id"] { result["id"] = sid }
                if let spid = session["speakerId"] { result["speakerId"] = spid }
                if let name = session["title"] { result["name"] = name }
                if let desc = session["desc"] { result["desc"] = desc }
                if let start = session["start"] { result["start"] = start }
                if let end = session["end"] { result["end"] = end }
                return result
            }
        }
        return nil
    }

}
