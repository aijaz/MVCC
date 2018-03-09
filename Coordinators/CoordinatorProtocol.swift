//
//  CoordinatorProtocol.swift
//  MyConf
//
//  Created by Aijaz Ansari on 3/8/18.
//  Copyright © 2018 Euclid Software, LLC. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    func attach(viewController: UIViewController)
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
}


// default implementation of Coordinator {
extension Coordinator {
    func viewDidLoad() { }

    func viewWillAppear() { }

    func viewDidAppear() { }
}

