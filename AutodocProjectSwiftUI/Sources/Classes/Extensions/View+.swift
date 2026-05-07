import SwiftUI

extension View {
    
    func connect(_ service: StorageService) -> some View {
        return service.connect(self)
    }
}
