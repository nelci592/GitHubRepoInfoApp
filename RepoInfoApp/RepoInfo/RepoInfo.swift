import SwiftUI

@main
struct RepoInfoAppApp: App {
    @StateObject var user = UserManager()
    
    var body: some Scene {
        WindowGroup {
            if user.isLogged {
                DashboardView()
                    .environmentObject(user)
            }else{
                LoginView()
                    .environmentObject(user)
            }
            
        }
    }
}
