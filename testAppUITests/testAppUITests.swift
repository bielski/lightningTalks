import XCTest

class testAppUITests: XCTestCase {
    
    var testApp: XCUIApplication!
    var secondTestApp: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        testApp = XCUIApplication(bundleIdentifier: "codework.testApp")
        testApp.launch()
        
        // Switch to different app
        //secondTestApp = XCUIApplication(bundleIdentifier: "codework.secondTestApp")
        //secondTestApp.activate()
    }
    
    func testExampleFirstMatch() {
        // Traditional queries
        // protect against interacting with multiple matches
        testApp.buttons["Done"].tap()
        
        // First match queries
        testApp.buttons.firstMatch.tap() // bad idea
        testApp.buttons["Done"].firstMatch.tap() // better idea
    }
    
    func testExampleActivity() {
        XCTContext.runActivity(named: "Tap button using activity") { _ in
            let button = testApp.buttons["Done"].firstMatch
            button.tap()
        }
    }
    
    func testExampleScreenshotAttachment() {
        XCTContext.runActivity(named: "Gather screenshots") { activity in
            // Capture screenshot for screen
            let mainScreen =  XCUIScreen.main
            let fullScreenshot = mainScreen.screenshot()
            let fullScreenshotAttachment = XCTAttachment(screenshot: fullScreenshot)
            fullScreenshotAttachment.lifetime = .keepAlways
            activity.add(fullScreenshotAttachment)
            
            // Capture screenshot for button
            let button =  testApp.buttons["Done"]
            let buttonScreenshot = button.screenshot()
            let buttonScreenshotAttachment = XCTAttachment(screenshot: fullScreenshot)
            buttonScreenshotAttachment.lifetime = .keepAlways
            activity.add(buttonScreenshotAttachment)
        }
    }
}
