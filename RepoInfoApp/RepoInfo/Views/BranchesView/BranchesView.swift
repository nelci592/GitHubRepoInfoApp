import SwiftUI

struct BranchesView: View {
    @EnvironmentObject private var user: UserManager
    @StateObject private var viewModel = BranchesViewModel()
    
    var selectedRepository: String
    
    var body: some View {
        Text("Branches of " + selectedRepository)
            List(viewModel.branches, id: \.name){branch in
                Text(branch.name)
            }
            .onAppear{
                viewModel.getBranches(username: user.username, repository: selectedRepository)
            }
    }
}

struct BranchesView_Previews: PreviewProvider {
    static var previews: some View {
        BranchesView(selectedRepository: "default")
    }
}
