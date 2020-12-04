import XCTest

class TicTacToeUITests: XCTestCase {

    func testPlayer1Win() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["A1"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["B1"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["A2"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["A3"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["B2"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["B3"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["C1"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["C2"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["C3"].tap()
        
        XCTAssertTrue(app.alerts["A winner is here"].exists)
    }
    
    func testDraw() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["C2"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["B1"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["A2"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["A3"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["B3"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["B2"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["A1"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["C3"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["C1"].tap()
        
        XCTAssertTrue(app.alerts["Not this time"].exists)
    }
    
    func testRestart() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["C2"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["B1"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["A2"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        
        app.buttons["Restart"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
    }
    
    func testPlayerClickingOnForbidenLocation() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["C2"].tap()
        XCTAssertTrue(app.staticTexts["Player 2"].exists)
        app.images["B1"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
        app.images["B1"].tap()
        XCTAssertTrue(app.staticTexts["Player 1"].exists)
    }

   
}
