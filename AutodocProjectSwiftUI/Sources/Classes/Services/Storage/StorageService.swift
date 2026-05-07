import Foundation
import CoreData
import SwiftUI

protocol StorageService {
    func save<T: StorageDB>(type: T.Type, completion: @escaping (T) -> Void)
    func delete<T: StorageDB>(entity: T)
    func connect(_ view: some View) -> AnyView
}
