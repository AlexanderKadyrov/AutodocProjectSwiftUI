import SwiftUI
import DI

final class ContentViewModel {
    
    @DI(\.syncService) private var syncService: SyncService
    
    func start() {
        syncService.start()
    }
    
    func delete(offsets: IndexSet, items: FetchedResults<NewsModelDB>) {
        guard let firstIndex = offsets.first else { return }
        let entity = items[firstIndex]
        syncService.delete(entity: entity)
    }
}
