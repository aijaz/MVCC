//
//  Network.swift
//  MyConf
//
//  Created by Aijaz Ansari on 7/30/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import Foundation
import UIKit

class Network {
    static let sharedInstance = Network()
    private init() {
    } //This prevents others from using the default '()' initializer for this class.

    class func retrieveJsonAtLocation (urlString: String, completionHandler: @escaping ()->Void) {
        let url = Bundle.main.url(forResource: urlString, withExtension: "json")
        Network.retrieveJsonAtUrl(url: url!, completionHandler: completionHandler)
    }

    private class func retrieveJsonAtUrl(url: URL, completionHandler: @escaping ()->Void ) {
        let conf = URLSessionConfiguration.default
        let sessionWithoutDelegate = URLSession(configuration: conf)
        let task:URLSessionDataTask = sessionWithoutDelegate.dataTask(with: url) { (data, response, error) in
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]

                Database.jsonData = jsonObject

                // n1 n2 n3

                completionHandler()
            }
            catch {
                NSLog("Can't read json: \(error)")
            }

            sessionWithoutDelegate.finishTasksAndInvalidate()
        }

        task.resume()


    }
}
