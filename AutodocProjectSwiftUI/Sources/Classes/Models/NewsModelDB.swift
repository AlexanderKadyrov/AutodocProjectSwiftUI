import Foundation
import CoreData

@objc(NewsModelDB)
final class NewsModelDB: StorageDB, Identifiable {
    
    @NSManaged var id: Int
    @NSManaged var title: String
    @NSManaged var subtitle: String
    @NSManaged var publishedDate: Date
    @NSManaged var url: String
    @NSManaged var fullUrl: URL
    @NSManaged var titleImageUrl: URL?
    @NSManaged var categoryType: String
    
    static func fetch() -> NSFetchRequest<NewsModelDB> {
        let request = NSFetchRequest<NewsModelDB>(entityName: "NewsModelDB")
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \NewsModelDB.id, ascending: true)
        ]
        return request
    }
}
