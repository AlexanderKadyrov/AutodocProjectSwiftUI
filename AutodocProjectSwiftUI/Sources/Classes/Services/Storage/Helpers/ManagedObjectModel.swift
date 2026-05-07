import Foundation
import CoreData

final class ManagedObjectModel {
    
    static let model = createManagedObjectModel()
    
    private static func createManagedObjectModel() -> NSManagedObjectModel {
        let managedObjectModel = NSManagedObjectModel()
        
        let newsModel = NSEntityDescription()
        newsModel.managedObjectClassName = String(describing: NewsModelDB.self)
        newsModel.name = String(describing: NewsModelDB.self)
        
        let id = NSAttributeDescription()
        id.name = "id"
        id.attributeType = .integer64AttributeType
        
        let title = NSAttributeDescription()
        title.name = "title"
        title.attributeType = .stringAttributeType
        
        let subtitle = NSAttributeDescription()
        subtitle.name = "subtitle"
        subtitle.attributeType = .stringAttributeType
        
        let publishedDate = NSAttributeDescription()
        publishedDate.name = "publishedDate"
        publishedDate.attributeType = .dateAttributeType
        
        let url = NSAttributeDescription()
        url.name = "url"
        url.attributeType = .stringAttributeType
        
        let fullUrl = NSAttributeDescription()
        fullUrl.name = "fullUrl"
        fullUrl.attributeType = .URIAttributeType
        
        let titleImageUrl = NSAttributeDescription()
        titleImageUrl.name = "titleImageUrl"
        titleImageUrl.attributeType = .URIAttributeType
        
        let categoryType = NSAttributeDescription()
        categoryType.name = "categoryType"
        categoryType.attributeType = .stringAttributeType
        
        newsModel.uniquenessConstraints = [[id]]
        newsModel.properties = [
            id,
            title,
            subtitle,
            publishedDate,
            url,
            fullUrl,
            titleImageUrl,
            categoryType
        ]
        
        managedObjectModel.entities = [newsModel]
        
        return managedObjectModel
    }
}
