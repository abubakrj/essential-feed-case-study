import EssentialFeed

class FeedStoreSpy: FeedStore {
    enum ReceivedMessage: Equatable {
        case deleteCachedFeed
        case insert([LocalFeedImage], Date)
        case retrieve
    }

    private(set) var receivedMessages = [ReceivedMessage]()

    private var deletionCompletions = [DeletionCompletion]()
    private var insertionCompletions = [InsertionCompletion]()
    private var retrieveCompletions = [RetrieveCompletion]()

    func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        deletionCompletions.append(completion)
        receivedMessages.append(.deleteCachedFeed)
    }

    func completeDeletion(with error: Error, at index: Int = 0) {
        deletionCompletions[index](error)
    }

    func completeDeletionSuccessfully(at index: Int = 0) {
        deletionCompletions[index](nil)
    }

    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        insertionCompletions.append(completion)
        receivedMessages.append(.insert(feed, timestamp))
    }

    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletions[index](error)
    }

    func completeInsertionSuccessfully(at index: Int = 0) {
        insertionCompletions[index](nil)
    }

    func retrieve(completion: @escaping RetrieveCompletion) {
        retrieveCompletions.append(completion)
        receivedMessages.append(.retrieve)
    }

    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrieveCompletions[index](.failure(error))
    }

    func completeRetrievalWithEmptyCache(index: Int = 0) {
        retrieveCompletions[index](.empty)
    }

    func completeRetrieval(with feed: [LocalFeedImage], timestamp: Date, index: Int = 0) {
        retrieveCompletions[index](.found(feed: feed, timestamp: timestamp))
    }
}
