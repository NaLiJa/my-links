import Foundation

@MainActor
@Observable
class SettingsViewModel {
    @ObservationIgnored private var apiClientRepository: ApiClientRepository
    @ObservationIgnored private var userRepository: UserRepository
    
    init(apiClientRepository: ApiClientRepository = RepositoriesContainer.shared.apiClientRepository, userRepository: UserRepository = RepositoriesContainer.shared.userRepository) {
        self.apiClientRepository = apiClientRepository
        self.userRepository = userRepository
    }
    
    var contactDeveloperSafariOpen = false
    var dataSourceSafariOpen = false
    var showBuildNumber = false
    var linkwardenSiteOpen = false
    var linkwardenRepoOpen = false
    var appInfoWebOpen = false
    var myOtherAppsOpen = false
    
    var apiClientInstance: ApiClient? {
        apiClientRepository.instance
    }
    
    var userData: UserData? {
        userRepository.data
    }
    
    func destroyServer() {
        apiClientRepository.destroy()
    }
}
