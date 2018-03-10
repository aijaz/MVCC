//
//  MasterViewController.swift
//  MyConf
//
//  Created by Aijaz Ansari on 7/30/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var coordinator: MasterCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()

        // Now that the tableView is available,
        // have the coordinator set up its dataSource and delegate
        coordinator?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        if let split = splitViewController {
            clearsSelectionOnViewWillAppear = split.isCollapsed
        }
        super.viewWillAppear(animated)

        // give the coordinator a chance to get fresh data
        coordinator?.viewWillAppear()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func refreshViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // view controllers should not know about flow
        // delegate that responsibility to the coordinator
        // But in the case of UISplitViewController or custom segues we have no choice
        if let indexPath = tableView.indexPathForSelectedRow {
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
            coordinator?.handleRowSelected(section: indexPath.section, row: indexPath.row, usingViewController: controller)
        }
    }
}

extension MasterViewController {
    func attach(coordinator: Coordinator) {
        self.coordinator = coordinator as? MasterCoordinator
    }
}


