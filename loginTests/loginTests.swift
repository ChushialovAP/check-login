//
//  loginTests.swift
//  loginTests
//
//  Created by Anton Chushialov on 12.11.2020.
//

import XCTest
@testable import login

class loginTests: XCTestCase {
    
    var sut: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
                
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testLoginForm_WhenLoaded_TextFieldAreConnected() throws {
        _ = try XCTUnwrap(sut.loginTextField, "The login UITextField is not connected")
    }
    
    func testLoginForm_WhenInputChanged_CheckWorksCorrectly() throws {
        XCTAssertEqual(sut.checkTextField("anton"), true, "check doesn't work correctly")
        XCTAssertEqual(sut.checkTextField("9anton"), false, "check doesn't work correctly")
        XCTAssertEqual(sut.checkTextField("anton@gmail"), false, "check doesn't work correctly")
        XCTAssertEqual(sut.checkTextField("-anton@gmal.com"), false, "check doesn't work correctly")
        XCTAssertEqual(sut.checkTextField(".anton"), false, "check doesn't work correctly")
        XCTAssertEqual(sut.checkTextField("anton@gmail.com"), true, "check doesn't work correctly")
    }

}
