//
//  Speaker.swift
//  MyConf
//
//  Created by Aijaz Ansari on 7/30/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import Foundation

class Speaker {
    private let id: String
    public private(set) var name: String
    public private(set) var imagePath: String?
    public private(set) var bio: String?
    public private(set) var twitterHandle: String?
    public private(set) var website: String?
    public private(set) var sessions = [Session]()
    // bb3

    // bb1

    init(id: String, name: String, imagePath: String?, bio: String?, twitterHandle: String?, website: String?) {
        self.id = id
        self.imagePath = imagePath
        self.name = name
        self.bio = bio
        self.twitterHandle = twitterHandle
        self.website = website
    }

    convenience init?(withId id: String?) {
        guard let id = id else {

            return nil
        }
        if let dict = Database.object(fromCollection: "speaker", withId: id),
            let name = dict["name"]
        {
            self.init(id: dict["id"]!
                , name: name
                , imagePath: dict["img"]
                , bio: dict["bio"]
                , twitterHandle: dict["twitter"]
                , website: dict["website"])
        }
        else {
            return nil
        }
    }

    // bb2

    func addSession(_ session: Session) {
        weak var weakSession = session
        sessions.append(weakSession!)
        // This will cause a retain cycle
        
        // bb4
    }

    func firstSessionName() -> String? {
        if sessions.count > 0 {
            return sessions[0].title
        }
        return nil
    }

}
