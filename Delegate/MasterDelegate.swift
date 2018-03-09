//
//  MasterDelegate.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/9/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import UIKit

class MasterDelegate: NSObject, UITableViewDelegate {

    weak var dataSource: MasterDataSource?

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header")!
        let label: UILabel = cell.contentView.viewWithTag(1) as! UILabel
        label.text = dataSource?.sessionTimeSlots[section].startTime
        return cell.contentView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

}
