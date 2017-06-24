import XCTest
@testable import testApp

class testAppTests: XCTestCase {
    let timeout = 10.0
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExampleWaiter() {
        // Open document expectation
        let document = UIDocument(fileURL: URL(string: "/Users/ewa")!)
        let documentExpectation = expectation(description: "Document opened")
        documentExpectation.isInverted = true
        
        document.open() { success in
            XCTAssert(success, "Failed to open document")
            documentExpectation.fulfill()
        }
        
        // Implicit wait (bezwględny, ślepy)
        waitForExpectations(timeout: timeout)
        
        // Explicit wait (wyraźny,sprecyzowany)
        wait(for: [documentExpectation], timeout: timeout, enforceOrder: true)
        
        XCTWaiter(delegate: self).wait(for: [documentExpectation], timeout: timeout)
        
        let result = XCTWaiter.wait(for: [documentExpectation], timeout: timeout)
        if result == .timedOut {
            // Handle timeout
        }
        
        // Waiter delegates to test
        // Waiter returns result
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
