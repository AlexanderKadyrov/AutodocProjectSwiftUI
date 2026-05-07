import Foundation
import CoreData
import SwiftUI

final class StorageServiceImpl: StorageService {
    
    private lazy var persistentContainer: PersistentContainer = {
        let container = PersistentContainer(managedObjectModel: managedObjectModel)
        container.loadPersistentStores { _, error in
            guard let error = error as? NSError else { return }
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        return container
    }()
    
    private let managedObjectModel: NSManagedObjectModel
    
    init(managedObjectModel: NSManagedObjectModel) {
        self.managedObjectModel = managedObjectModel
    }
    
    func save<T: StorageDB>(type: T.Type, completion: @escaping (T) -> Void) {
        persistentContainer.performBackground { context in
            let entity = T.init(context: context)
            completion(entity)
            context.saveOrRollback(completion: nil)
        }
    }
    
    func delete<T: StorageDB>(entity: T) {
        persistentContainer.performMain { context in
            context.delete(entity: entity)
        }
    }
    
    func connect(_ view: some View) -> AnyView {
        return AnyView(
            view
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        )
            
    }
}
