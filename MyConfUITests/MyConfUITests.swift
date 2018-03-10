//
//  MyConfUITests.swift
//  MyConfUITests
//
//  Created by Aijaz Ansari on 7/30/17.
//  Copyright © 2017 Euclid Software, LLC. All rights reserved.
//

import XCTest

class MyConfUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Keynote"]/*[[".cells.staticTexts[\"Keynote\"]",".staticTexts[\"Keynote\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let bioButton = app/*@START_MENU_TOKEN@*/.buttons["(Bio)"]/*[[".scrollViews.buttons[\"(Bio)\"]",".buttons[\"(Bio)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bioButton.tap()

        XCTAssertNotNil(app.staticTexts["@myConf1"].value)

        let sessionDetailButton = app.navigationBars["Speaker Bio"].buttons["Session Detail"]
        sessionDetailButton.tap()
        
        let myconfButton = app.navigationBars["Session Detail"].buttons["MyConf"]
        myconfButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Designing for Developers"]/*[[".cells.staticTexts[\"Designing for Developers\"]",".staticTexts[\"Designing for Developers\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf2"].value)
        sessionDetailButton.tap()
        myconfButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Swift Justice"]/*[[".cells.staticTexts[\"Swift Justice\"]",".staticTexts[\"Swift Justice\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf13"].value)
        sessionDetailButton.tap()
        myconfButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Open Plan Offices"]/*[[".cells.staticTexts[\"Open Plan Offices\"]",".staticTexts[\"Open Plan Offices\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf4"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["You're Not an Impostor"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf5"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["Bad Puns for Fun and Profit"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf6"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["Know your Memes"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf7"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["Guilt-Driven Development"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf14"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["Introduction to Testing"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf8"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["Weak Pointers are Neither Weak nor Pointers"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf9"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["You,too,can learn Photoshop"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf10"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["Practical SQL"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf11"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["AutoLayout:Resistance is Futile"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf12"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["What Time is It?"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf3"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["AR Rulers - The Fart Apps of this Generation"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf14"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["MVP for Designers"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf1"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["Dealing with Difficult People"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf2"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["MVP for Designers"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf1"].value)
        sessionDetailButton.tap()
        myconfButton.tap()

        tablesQuery.staticTexts["Design Patterns in Swift"].tap()
        bioButton.tap()
        XCTAssertNotNil(app.staticTexts["@myConf13"].value)
        sessionDetailButton.tap()
        myconfButton.tap()


    }

//    func testLabels {
//
//        let app = XCUIApplication()
//        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Keynote"]/*[[".cells.staticTexts[\"Keynote\"]",".staticTexts[\"Keynote\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.buttons["(Bio)"]/*[[".scrollViews.buttons[\"(Bio)\"]",".buttons[\"(Bio)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.scrollViews.otherElements.staticTexts["@myConf1"].tap()
//
//    }

}
