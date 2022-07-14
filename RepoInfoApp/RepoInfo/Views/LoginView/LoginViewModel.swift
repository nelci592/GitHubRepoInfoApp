import Foundation

final class LoginViewModel: ObservableObject{
    
    @Published var input: String = ""
    @Published var isValidUserName: Bool = false
    
    //required for the Alert
    @Published var shown = false
    @Published var message = ""
    
    
    func validateUser(userInput: String){
        if userInput.count < 4 {
            message = "Username is at least 4 chars!"
            shown.toggle()}
        else if userInput.count > 39 {
            message = "Username is at most 39 chars!"
            shown.toggle()}
        else {
            NetworkManager().checkUser (username: userInput, completion:{(isValid) in
                self.isValidUserName = isValid
                if (!self.isValidUserName){
                    self.message = "Invalid username"
                    self.shown.toggle()}
            })
        }
        
    }
}
