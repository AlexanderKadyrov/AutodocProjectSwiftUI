import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func saveOrRollback(completion: ((Result<(), Error>) -> Void)?) {
        performAndWait { [weak self] in
            guard let self else { return }
            do {
                try save()
                completion?(.success(()))
            } catch(let error) {
                rollback()
                completion?(.failure(error))
            }
        }
    }
    
    func delete<E: StorageDB>(entity: E) {
        delete(entity)
        saveOrRollback(completion: nil)
    }
}
