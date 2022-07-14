import Foundation

final class BranchesViewModel: ObservableObject{
    @Published var branches: [Branch] = []
    
    func getBranches(username: String, repository: String) {
        NetworkManager().getBranches (username: username, repository: repository, completion:{(branches) in
            self.branches = branches
        })
    }
    
}
