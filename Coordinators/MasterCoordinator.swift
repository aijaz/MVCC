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
    var sessionCoordinator = SessionCoordinator()

    let dataSource = MasterDataSource()
    let delegate = MasterDelegate()

    func viewWillAppear() {
        getData()
    }

    func viewDidLoad() {
        delegate.dataSource = dataSource
        viewController?.tableView.dataSource = dataSource
        viewController?.tableView.delegate = delegate
    }

    func getData() {
        Network.retrieveJsonAtLocation(urlString: "sampleJSONTiny") {
            self.dataSource.refreshViewModels()
            self.viewController?.refreshViews()
        }
    }

    func handleRowSelected(section: Int, row: Int, usingViewController viewController: DetailViewController?) {
        if let controller = viewController {
            sessionCoordinator.attach(viewController: controller)
        }
        let session = dataSource.sessionTimeSlots[section].sessions[row]
        sessionCoordinator.session = session
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

