import Foundation
import SwiftUI

@MainActor
@Observable
class UserRepository {
    let apiClientRepository: ApiClientRepository
    
    init(apiClientRepository: ApiClientRepository) {
        self.apiClientRepository = apiClientRepository
    }
        
    var data: UserData? = nil
    var loading = true
    var error = false
    
    func loadData() async {
        if loading == true {
            self.loading = true
        }
        guard let instance = apiClientRepository.instance else { return }
        let result = await instance.users.fetchUsers()
        if let data = result.data?.response {
            DispatchQueue.main.async {
                self.data = data
                self.loading = false
                self.error = false
            }
        }
        else {
            if result.statusCode == 401 {
                apiClientRepository.destroy()
                return
            }
            DispatchQueue.main.async {
                self.loading = false
                self.error = true
            }
        }
    }
}
