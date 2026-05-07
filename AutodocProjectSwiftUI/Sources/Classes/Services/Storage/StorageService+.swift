import Foundation
import DI

fileprivate extension DIStorage {
    struct StorageServiceKey: DIKey {
        nonisolated(unsafe) static var currentValue: StorageService = StorageServiceImpl(
            managedObjectModel: ManagedObjectModel.model
        )
    }
}

extension DIStorage {
    var storageService: StorageService {
        get { Self.self[StorageServiceKey.self] }
        set { Self.self[StorageServiceKey.self] = newValue }
    }
}
