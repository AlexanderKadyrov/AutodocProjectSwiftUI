import Foundation
import DI

fileprivate extension DIStorage {
    struct SyncServiceKey: DIKey {
        nonisolated(unsafe) static var currentValue: SyncService = SyncServiceImpl()
    }
}

extension DIStorage {
    var syncService: SyncService {
        get { Self.self[SyncServiceKey.self] }
        set { Self.self[SyncServiceKey.self] = newValue }
    }
}
