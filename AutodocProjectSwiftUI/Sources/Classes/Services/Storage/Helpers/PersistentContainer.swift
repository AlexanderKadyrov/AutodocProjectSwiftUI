import Foundation
import CoreData

final class PersistentContainer: NSPersistentContainer, @unchecked Sendable {
    
    init(managedObjectModel: NSManagedObjectModel) {
        super.init(name: "coredata.db", managedObjectModel: managedObjectModel)
        viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func performMain(completion: @escaping (NSManagedObjectContext) -> Void) {
        completion(viewContext)
    }
    
    func performBackground(completion: @escaping (NSManagedObjectContext) -> Void) {
        performBackgroundTask { [weak self] backgroundContext in
            guard let self else { return }
            bind(backgroundContext: backgroundContext)
            completion(backgroundContext)
        }
    }
    
    private func bind(backgroundContext: NSManagedObjectContext) {
        backgroundContext.persistentStoreCoordinator = persistentStoreCoordinator
        backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(backgroundContextDidSave(notification:)),
            name: .NSManagedObjectContextDidSave,
            object: backgroundContext
        )
    }
    
    @objc
    private func backgroundContextDidSave(notification: Notification) {
        guard
            let backgroundContext = notification.object as? NSManagedObjectContext,
            backgroundContext !== viewContext
        else {
            return
        }
        viewContext.perform { [weak self] in
            guard let self else { return }
            viewContext.mergeChanges(fromContextDidSave: notification)
        }
    }
}
