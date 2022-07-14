import Foundation

class UserManager: ObservableObject{
    
    @Published var username: String =  UserDefaults.standard.string(forKey: "Username") ?? ""
    
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "IsLogged")
}

