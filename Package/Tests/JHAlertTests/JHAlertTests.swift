import XCTest
@testable import JHAlert

final class JHAlertTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(JHAlert().confirmString, "好的!")
    }
}
