import SwiftUI

struct Paragraph: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .lineSpacing(6)
            .tracking(0.25)
            .padding(.horizontal, 30)

    }
}
