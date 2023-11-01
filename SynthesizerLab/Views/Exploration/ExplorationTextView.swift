import SwiftUI

struct ExplorationTextView: View {
    var title: String
    var titleGradient: [Color]
    
    var text: [String]
    
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 30) {
            
            HStack {
                Spacer()
                
                AnimatedUnderlinedText(thickness: 8, 
                                       gradient: LinearGradient(colors: titleGradient, startPoint: .leading, endPoint: .trailing)) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .tracking(2)
                        .padding(.bottom, -5)
                }
                
                Spacer()
            }
            .padding(.top, 30)
            .padding(.bottom, 15)
            
            ForEach(text, id: \.self) { p in
                Paragraph(p)
            }
            
        }
        .frame(maxWidth: 900)
    }
}
