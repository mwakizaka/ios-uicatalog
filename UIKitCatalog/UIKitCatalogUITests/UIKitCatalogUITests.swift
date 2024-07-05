//
//  UIKitCatalogUITests.swift
//  UIKitCatalogUITests
//
//  Created by mwakizaka on 2024/07/05.
//  Copyright © 2024 Apple. All rights reserved.
//

import XCTest

final class UIKitCatalogUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Go to Switches page
        let app = XCUIApplication()
        app.launch()
        app.staticTexts["Switches"].tap()
        XCTAssert(app.navigationBars.firstMatch.staticTexts["Switches"].exists)
        
        // Toggle switches
        let defaultSwitch = app.tables.containing(.other, identifier: "DEFAULT").firstMatch.switches.firstMatch;
        let tintedSwitch = app.tables.containing(.other, identifier: "TINTED").cells.element(boundBy: 1).switches.firstMatch;
        XCTAssertEqual(defaultSwitch.value as! String, "1");
        XCTAssertEqual(tintedSwitch.value as! String, "1");
        defaultSwitch.tap()
        XCTAssertNotEqual(defaultSwitch.value as! String, "1");
        defaultSwitch.tap()
        tintedSwitch.tap()
        XCTAssertEqual(defaultSwitch.value as! String, "1");
        XCTAssertNotEqual(tintedSwitch.value as! String, "1");
        app.buttons["UIKitCatalog"].tap()

        // Go to Activity Indicators page
        app.staticTexts["Activity Indicators"].tap()
        XCTAssertTrue(app.otherElements["DEFAULT"].exists)
        app.buttons["UIKitCatalog"].tap()

        // Go to Web View page
        app.swipeUp()
        app.staticTexts["Web View"].tap()
        XCTAssertTrue(app.navigationBars["Web View"].exists)
        app.buttons["UIKitCatalog"].tap()

        // Go to Activity Indicators page again
        app.swipeDown()
        app.staticTexts["Activity Indicators"].tap()
        XCTAssertTrue(app.otherElements["DEFAULT"].exists)
        app.buttons["UIKitCatalog"].tap()
    }
}
