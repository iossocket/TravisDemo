//
//  TravisDemoUITests.swift
//  TravisDemoUITests
//
//  Created by Xueliang Zhu on 1/26/16.
//  Copyright © 2016 Xueliang Zhu. All rights reserved.
//

import XCTest

class TravisDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSuccessLogin() {
        let app = XCUIApplication()
        let emailAddressTextField = app.textFields["email address"]
        emailAddressTextField.tap()
        emailAddressTextField.typeText("aa@126.com")
        
        let secureTextField = app.otherElements.containingType(.StaticText, identifier:"User Name").childrenMatchingType(.SecureTextField).element
        secureTextField.tap()
        secureTextField.typeText("12345678")
        app.buttons["Login"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Result")
        XCTAssert(app.alerts.element.staticTexts[ValidationErrorType.NoError.rawValue].exists)
    }
    
    func testUserNameEmpty() {
        let app = XCUIApplication()
        let emailAddressTextField = app.textFields["email address"]
        emailAddressTextField.tap()
        emailAddressTextField.typeText("")
        
        let secureTextField = app.otherElements.containingType(.StaticText, identifier:"User Name").childrenMatchingType(.SecureTextField).element
        secureTextField.tap()
        secureTextField.typeText("12345678")
        app.buttons["Login"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Result")
        XCTAssert(app.alerts.element.staticTexts[ValidationErrorType.EmptyError.rawValue].exists)
    }
    
    func testPasswordMinError() {
        let app = XCUIApplication()
        let emailAddressTextField = app.textFields["email address"]
        emailAddressTextField.tap()
        emailAddressTextField.typeText("aa@126.com")
        
        let secureTextField = app.otherElements.containingType(.StaticText, identifier:"User Name").childrenMatchingType(.SecureTextField).element
        secureTextField.tap()
        secureTextField.typeText("123")
        app.buttons["Login"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Result")
        XCTAssert(app.alerts.element.staticTexts[ValidationErrorType.PasswordMinError.rawValue].exists)
    }
}
