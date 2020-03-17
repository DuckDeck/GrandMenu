import XCTest
@testable import GrandMenu

final class GrandMenuTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GrandMenu().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
