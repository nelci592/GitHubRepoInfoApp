import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.black)
      Spacer()
    }
    .padding()
    .background(Color.green.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
    .frame(width: 200)
  }
}
