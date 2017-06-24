import XCTest
@testable import testApp

class testAppTests: XCTestCase {
    let timeout = 1.0
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExampleWaiter() {
        // Example expectation
        let exampleExpectation = expectation(description: "Example expectation")
        exampleExpectation.isInverted = true
        
        // Implicit wait
        waitForExpectations(timeout: timeout)
        
        // Explicit wait with XCTWaiter
        // #1
        wait(for: [exampleExpectation], timeout: timeout, enforceOrder: true)
        
        // #2
        XCTWaiter(delegate: self).wait(for: [exampleExpectation], timeout: timeout)
        
        // #3
        let result = XCTWaiter.wait(for: [exampleExpectation], timeout: timeout)
        if result == .timedOut {
            // Handle timeout
        }
    }
}
