import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject,
                                     file: StaticString = #filePath,
                                     line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(
                instance,
                "Instance should have been deallocate. Potential memory weak",
                file: file,
                line: line
            )
        }
    }
}