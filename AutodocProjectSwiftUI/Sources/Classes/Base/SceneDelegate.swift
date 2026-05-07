import CoreData
import SwiftUI
import UIKit
import DI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    @DI(\.storageService) private var storageService: StorageService
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let viewModel = ContentViewModel()
        let contentView = ContentView(viewModel: viewModel)
            .connect(storageService)
        
        let viewController = UIHostingController(rootView: contentView)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
