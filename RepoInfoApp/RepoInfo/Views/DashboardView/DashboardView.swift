import SwiftUI


struct DashboardView: View {
    @EnvironmentObject private var user: UserManager
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationView {
            
            List(viewModel.repos, id: \.name){repo in
                NavigationLink(destination: BranchesView(selectedRepository: repo.name)) {
                    RepositoryView(repository: repo)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Log out") {
                        user.username = ""
                        user.isLogged = false
                        UserDefaults.standard.set("", forKey: "Username")
                        UserDefaults.standard.set(false, forKey: "IsLogged")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Refresh") {
                        viewModel.getData(username: user.username)
                        viewModel.self.restartTimer()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Text("Updated before: " + String(viewModel.minSinceLastUpdate) + "min")
                }
            }
            .navigationTitle("All repositories")
            
        }
        .onReceive(viewModel.timer) { _ in
            viewModel.self.minSinceLastUpdate += 1
        }.onAppear{
            viewModel.self.minSinceLastUpdate = 0
            viewModel.self.startTimer()
            viewModel.getData(username: user.username)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
