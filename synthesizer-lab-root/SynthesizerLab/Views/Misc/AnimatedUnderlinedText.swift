import SwiftUI

// create a copy of the easeInOut function, but with a delay parameter for easier passage of the delay value
// TODO: this whole delay thing lowk might end up being useless :/ 
extension Animation {
    static func easeInOutWithDelay(duration: Double, delay: Double) -> Animation {
        Animation.easeInOut(duration: duration)
            .delay(delay)
    }
}

struct AnimatedUnderlinedText<Content: View>: View {
    
    var thickness: CGFloat = 10
    var duration: Double = 2.0
    var delay: Double = 0.0
    let gradient: LinearGradient
    
    let content: () -> Content
    
    @State private var maskLength: Double = 0.00001
    
    
    var body: some View {
        
        VStack {
            content()            
            
            Rectangle()
                .fill(gradient)
                .frame(height: thickness)
            
                // make edges rounded
                .mask(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 100)
                        .scaleEffect(x: maskLength, anchor: .leading)
                }
            
            // begin animation when this view appears
            .onAppear {
                withAnimation(.easeInOutWithDelay(duration: duration, delay: delay)) {
                    maskLength = 1
                }
            }
        }
        .fixedSize()
        
    }
}
