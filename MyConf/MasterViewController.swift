//
//  MasterViewController.swift
//  MyConf
//
//  Created by Aijaz Ansari on 7/30/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import UIKit

struct SectionItem {
    var startTime: String
    var sessions: [Session]
}


class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var sessionTimeSlots = [SectionItem]()

    let dateFormatter: DateFormatter = {
        let d = DateFormatter()
        d.dateFormat = "yyyyMMddHHmm"
        d.doesRelativeDateFormatting = true
        d.dateStyle = .short
        d.timeStyle = .medium
        return d
    }()
    let sectionHeaderDateFormatter: DateFormatter = {
        let d = DateFormatter()
        d.dateFormat = "EE, MMM d hh:mm a"
        d.doesRelativeDateFormatting = true
        d.dateStyle = .short
        d.timeStyle = .medium
        return d
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem


        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }

        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil

        tableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)

        // Get data
        Network.retrieveJsonAtLocation(urlString: "sampleJSONTiny") {
            self.refresh()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refresh() {
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

    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                let session = sessionTimeSlots[indexPath.section].sessions[indexPath.row]
                controller.session = session
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sessionTimeSlots.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionTimeSlots[section].sessions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
//        bgColorView.backgroundColor = UIColor(colorLiteralRed: 200/256.0, green: 126/256.0, blue: 193/256.0, alpha: 1.0)
        bgColorView.backgroundColor = UIColor(colorLiteralRed: 200/256.0, green: 200/256.0, blue: 193/256.0, alpha: 1.0)
        cell.selectedBackgroundView = bgColorView

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header")!
        let label: UILabel = cell.contentView.viewWithTag(1) as! UILabel
        label.text = sessionTimeSlots[section].startTime
        return cell.contentView
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

}

