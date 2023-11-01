import SwiftUI

struct WaveGrid: Shape {
    var x: Scale
    var y: Scale
    
    func path(in rect: CGRect) -> Path {
        let width = Double(rect.width)
        let height = Double(rect.height)
        
        //TODO:  please change these variable names at some point please please they are so nasty
        let xValues = Int((x.max - x.min) / x.increment)
        let yValues = Int((y.max - y.min) / y.increment)
                
        
        // CREATE PATH AND DRAW BOUNDARIES
        var path = Path(rect)
        
        // DRAW GRID LINES
        if xValues > 2 {
            let colWidth = width / Double(xValues)
            
            for verticalDividerNum in 1...(xValues - 1) {
                let xPos = colWidth * Double(verticalDividerNum)
                path.move(to: CGPoint(x: xPos, y: 0))
                path.addLine(to: CGPoint(x: xPos, y: height))
            }
        }
        
        if yValues > 2 {
            let rowWidth = height / Double(yValues)
            
            for horizontalDividerNum in 1...(yValues - 1) {
                let yPos = rowWidth * Double(horizontalDividerNum)
                path.move(to: CGPoint(x: 0, y: yPos))
                path.addLine(to: CGPoint(x: width, y: yPos))
            }
        }
        
        return path
    }
}

