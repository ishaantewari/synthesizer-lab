import SwiftUI
import Foundation

struct WavePath: Shape {
    
    var oscillations: Float
    var amplitude: Float
    var waveFunction: (Float) -> Float
    var phaseShift: Float
    
    var animatableData: Float {
        get { phaseShift }
        set { phaseShift = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let width = Float(rect.width)
        let height = Float(rect.height)
        let midline = height / 2
        
        
        var path = Path()
        path.move(to: CGPoint(x: 0, y: Double(amplitude * waveFunction(phaseShift + pi) + midline)))
        
        for x in stride(from: 0, through: width, by: 1) {
            // assume box is one second long
            let percentX = x / width
            
            let waveFuncOut = waveFunction((percentX * oscillations * twoPi) + phaseShift + pi)
            
            let y = (amplitude * waveFuncOut) + midline
            path.addLine(to: CGPoint(x: Double(x), y: Double(y)))
        }
        
        return path
    }
}
