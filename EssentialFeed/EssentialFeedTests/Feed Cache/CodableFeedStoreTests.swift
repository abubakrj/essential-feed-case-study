import XCTest
import EssentialFeed

class CodableFeedStore {

    func retrieve(completion: @escaping FeedStore.RetrieveCompletion) {

    }
}

final class CodableFeedStoreTests: XCTestCase {

    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = CodableFeedStore()

        sut.retrieve { result in
            
        }
    }
}
