import XCTest
@testable import Trie

final class TrieTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Trie().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
