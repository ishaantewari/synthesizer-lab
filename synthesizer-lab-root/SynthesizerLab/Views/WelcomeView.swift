import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 150) {
            VStack(spacing: 0) {
                Text("Welcome to")
                    .font(.title)
                    .tracking(1)
                    .padding(.bottom, 30)
                
                AnimatedUnderlinedText(thickness: 10, 
                                       gradient: LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)) {
                    Text("Synthesizer Lab")
                        .font(.system(size: 44))
                        .fontWeight(.bold)
                        .tracking(2)
                        .padding(.bottom, 10)
                }
            }            
                                
        }
    }
}
