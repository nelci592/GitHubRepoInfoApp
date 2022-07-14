import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var user: UserManager
    @State var input: String = ""
    @State var isValid: Bool = false
    
    //required for the Alert
    @State var shown = false
    @State var message = ""
    
    func setUserState(username: String){
        user.isLogged = true
        user.username = username
        UserDefaults.standard.set(username, forKey: "Username")
        UserDefaults.standard.set(true, forKey: "IsLogged")
    }
    
    func validateUser(userInput: String){
        if userInput.count < 4 {
            message = "Username is at least 4 chars!"
            shown.toggle()}
        else if userInput.count > 39 {
            message = "Username is at most 39 chars!"
            shown.toggle()}
        else {
            NetworkManager().checkUser (username: userInput, completion:{(isValid) in
                self.isValid = isValid
                if (isValid){
                    setUserState(username: userInput)
                }
                else{
                    message = "Invalid username"
                    shown.toggle()}
            })
        }
    }
    
    var body: some View {
        VStack {
            Image("github")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
            Text("Find your GitHub Repositories")
            
            
            TextField("Enter your GitHub username", text: $input)
                .frame(width: 220, height: 20, alignment: SwiftUI.Alignment.center)
                .padding(EdgeInsets(top: 8, leading: 16,
                                    bottom: 8, trailing: 16))
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.blue)
                )
            
                .shadow(color: Color.gray.opacity(0.4),
                        radius: 3, x: 1, y: 2)
           
            Button(
                "Find Repository",
                action: {
                    validateUser(userInput: input)
                }
                
            ).disabled(input.isEmpty)
            .buttonStyle(RoundedRectangleButtonStyle())
        }.blur(radius: shown ? 30 : 0)
            .autocapitalization(.none)
        
        if shown {
            AlertView(shown: $shown, message: message)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
