//
//  MyConfTests.swift
//  MyConfTests
//
//  Created by Aijaz Ansari on 7/30/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import XCTest
@testable import MyConf

class MyConfTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        let mc = appDelegate.masterCoordinator

        mc.handleRowSelected(section: 1, row: 0, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf1")

        mc.handleRowSelected(section: 3, row: 0, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf2")

        mc.handleRowSelected(section: 3, row: 1, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf13")

        mc.handleRowSelected(section: 3, row: 2, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf4")



        mc.handleRowSelected(section: 5, row: 0, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf5")

        mc.handleRowSelected(section: 5, row: 1, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf6")

        mc.handleRowSelected(section: 5, row: 2, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf7")



        mc.handleRowSelected(section: 7, row: 0, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf14")



        mc.handleRowSelected(section: 9, row: 0, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf8")

        mc.handleRowSelected(section: 9, row: 1, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf9")

        mc.handleRowSelected(section: 9, row: 2, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf10")




        mc.handleRowSelected(section: 11, row: 0, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf11")

        mc.handleRowSelected(section: 11, row: 1, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf12")

        mc.handleRowSelected(section: 11, row: 2, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf3")




        mc.handleRowSelected(section: 13, row: 0, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf14")

        mc.handleRowSelected(section: 13, row: 1, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf1")

        mc.handleRowSelected(section: 13, row: 2, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf2")




        mc.handleRowSelected(section: 15, row: 0, usingViewController: nil)
        mc.sessionCoordinator.handleBioTapped()
        XCTAssert(mc.sessionCoordinator.bioCoordinator?.speakerLabelsCoordinator.twitter == "myConf13")










    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
