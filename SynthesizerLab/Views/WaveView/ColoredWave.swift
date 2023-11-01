import SwiftUI

struct ColoredWave: View {  
    var colors: [Color]
    var thickness: CGFloat
        
    var wavePath: () -> WavePath
        
    var body: some View {
        wavePath()
            .stroke(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                
    }
}
