import SwiftUI

class NetworkManager: ObservableObject {
    
    func checkUser(username: String,  completion: @escaping (Bool) -> Void){
        let address = "https://api.github.com/users/" + username
        guard let url = URL (string: address) else {return}
        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
        guard let response = response as? HTTPURLResponse else { return }
        completion(response.statusCode == 200)
        }
        dataTask.resume()
    }
    
    func getRepositories(username: String,  completion: @escaping ([Repository]) -> ()){
        let address = "https://api.github.com/users/" + username + "/repos"
        guard let url = URL (string: address) else {return}
        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            guard let data = data else { return }

            DispatchQueue.main.async {
                do {
                    let repos = try JSONDecoder().decode([Repository].self, from: data)
                    completion(repos);

                } catch let error {
                    print("==== Error decoding: ==== ", error)
                }
            }

        }
        dataTask.resume()
    }
    
    func getBranches(username: String, repository: String, completion: @escaping ([Branch]) -> ()){
        let address = "https://api.github.com/repos/" + username + "/" + repository + "/branches"
        guard let url = URL (string: address) else {return}
        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            guard let data = data else { return }

            DispatchQueue.main.async {
                do {
                    let branches = try JSONDecoder().decode([Branch].self, from: data)
                    completion(branches);

                } catch let error {
                    print("==== Error decoding: ==== ", error)
                }
            }

        }
        dataTask.resume()
    }
    
}


