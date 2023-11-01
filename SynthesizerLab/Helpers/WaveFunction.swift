import Foundation

let pi = Float.pi
let twoPi = 2 * Float.pi

enum WaveType {
    case sine
    case triangle
    case sawtooth
    case square
}

struct WaveFunction {
    static let sine = {(x: Float) -> Float in 
        return sin(x)
    }
    
    static let triangle = { (x: Float) -> Float in
        let truncatedX = x.truncatingRemainder(dividingBy: twoPi)        
        var y = 2 * truncatedX / pi
        
         if truncatedX > 3*pi/2 {
            y = y - 4
        } else if !(truncatedX <= pi/2) {
            y = 2 - y
        }
                
        return y
    }

    
    static let sawtooth = { (x: Float) -> Float in
        let truncatedX = x.truncatingRemainder(dividingBy: twoPi)
        return 1.0 - (2.0 * truncatedX / (twoPi))
    }
    
    static let square = { (phase: Float) -> Float in
        if phase.truncatingRemainder(dividingBy: twoPi) <= pi {
            return 1.0
        } else {
            return -1.0
        }
    }
}
