import Foundation
import SwiftUI

protocol SyncService {
    func start()
    func delete(entity: NewsModelDB)
}
