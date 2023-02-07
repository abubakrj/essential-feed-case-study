import XCTest

class LocalFeedLoader {
    init(store: FeedStore) {

    }
}

class FeedStore {
    var deleteCachedFeedCallCount: Int = 0
}

final class CacheFeedUseCaseTests: XCTestCase {

    func test_init_doesNotCallDeleteCacheUponCreation() {
        let store = FeedStore()
        let sut = LocalFeedLoader(store: store)
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
