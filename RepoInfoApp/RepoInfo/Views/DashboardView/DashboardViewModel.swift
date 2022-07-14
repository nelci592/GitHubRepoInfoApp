import Foundation

final class DashboardViewModel: ObservableObject{
    
    @Published var repos: [Repository] = []
    @Published var minSinceLastUpdate = 0
    @Published var timer: Timer.TimerPublisher = Timer.publish(every: 60, on: .main, in: .common)
    
    func startTimer() {
        minSinceLastUpdate = 0
        timer = Timer.publish(every: 60, on: .main, in: .common)
        _ = timer.connect()
    }

    func stopTimer() {
        timer.connect().cancel()
    }
    
    func restartTimer(){
        startTimer()
        startTimer()
    }
    
    func getData(username: String) {
        NetworkManager().getRepositories (username: username, completion:{(repos) in
            self.repos = repos
        })
        print("Input username " + username)
    }
    
    
}
