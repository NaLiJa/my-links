import Foundation

extension Notification.Name {
    static let repositoriesDidReset = Notification.Name("repositoriesDidReset")
}

@MainActor
class RepositoriesContainer {
    @MainActor static var shared = RepositoriesContainer()
    
    let apiClientRepository = ApiClientRepository()
    
    lazy var userRepository: UserRepository = {
        return UserRepository(apiClientRepository: apiClientRepository)
    }()
    
    lazy var collectionsRepository: CollectionsRepository = {
        return CollectionsRepository(apiClientRepository: apiClientRepository)
    }()
    
    lazy var linkManagerRepository: LinkManagerRepository = {
        return LinkManagerRepository(apiClientRepository: apiClientRepository, userRepository: userRepository)
    }()
    
    lazy var tagManagerRepository: TagManagerRepository = {
        return TagManagerRepository(apiClientRepository: apiClientRepository)
    }()

    
    let navigationRepository = NavigationRepository()
    
    let toastRepository = ToastRepository()
    
    let progressIndicatorRepository = ProgressIndicatorRepository()
    
    static func reset() {
        Task { @MainActor in
            self.shared = RepositoriesContainer()
            NotificationCenter.default.post(name: .repositoriesDidReset, object: nil)
        }
    }
}
