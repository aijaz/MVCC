//
//  MasterCoordinator.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/8/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import UIKit

class MasterCoordinator: NSObject, Coordinator {
    weak var viewController: MasterViewController?

    func viewWillAppear() {
        getData()
    }

    func getData() {
        Network.retrieveJsonAtLocation(urlString: "sampleJSONTiny") {
            self.viewController?.refreshViewModels()
            self.viewController?.refreshViews()
        }
    }
}


extension MasterCoordinator {
    func attach(viewController: UIViewController) {
        self.viewController = viewController as? MasterViewController
        self.viewController?.attach(coordinator: self)
        // viewWillAppear was already called on the view controller get data now
        getData()
    }
}

