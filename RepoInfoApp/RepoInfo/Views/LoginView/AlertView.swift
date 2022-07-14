import SwiftUI

struct AlertView: View {
    
    @Binding var shown: Bool
    
    var message: String
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text(message).foregroundColor(Color.white)
            Spacer()
            Divider()
            HStack {
                Button("Ok") {
                    shown.toggle()
                }.frame(width: UIScreen.main.bounds.width/2-30, height: 40)
                    .foregroundColor(.white)
            }
            
        }.frame(width: UIScreen.main.bounds.width-50, height: 200)
        
            .background(Color.black.opacity(0.5))
            .cornerRadius(12)
            .clipped()
        
    }
}

struct CustomAlert_Previews: PreviewProvider {
    
    static var previews: some View {
        AlertView(shown: .constant(false), message: "")
    }
}
