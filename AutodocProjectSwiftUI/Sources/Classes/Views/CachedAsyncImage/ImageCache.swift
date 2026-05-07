import SwiftUI
import UIKit

final class ImageCache {
    
    nonisolated(unsafe) static let shared = NSCache<NSURL, UIImage>()
    
    init() {
        ImageCache.shared.countLimit = 100
        ImageCache.shared.totalCostLimit = 50 * 1024 * 1024
    }
}
