import SwiftUI

struct ThankYouView: View {
    var body: some View {
        
                
                AnimatedUnderlinedText(thickness: 10, 
                                       gradient: LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)) {
                    Text("Thank You!")
                        .font(.system(size: 44))
                        .fontWeight(.bold)
                        .tracking(2)
                        .padding(.bottom, 10)
                }
        
    }
}
