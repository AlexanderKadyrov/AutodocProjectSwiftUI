import Foundation
import CoreData
import DI

final class SyncServiceImpl: SyncService {
    
    @DI(\.storageService) private var storageService: StorageService
    @DI(\.newsService) private var newsService: NewsService
    
    func start() {
        Task { [weak self] in
            guard let self else { return }
            do {
                let response = try await newsService.fetchNews(offset: 1, limit: 15)
                for item in response.news {
                    storageService.save(type: NewsModelDB.self) { entity in
                        entity.id = item.id
                        entity.title = item.title
                        entity.subtitle = item.description
                        entity.publishedDate = item.publishedDate
                        entity.url = item.url
                        entity.fullUrl = item.fullUrl
                        entity.titleImageUrl = item.titleImageUrl
                        entity.categoryType = item.categoryType
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    func delete(entity: NewsModelDB) {
        storageService.delete(entity: entity)
    }
}
