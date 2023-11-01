import SwiftUI

struct ContentView: View {
    @State private var currentPage = 1
    
    var body: some View {
        
        VStack(spacing: 50) {
            switch currentPage {
            case 1:
                WelcomeView()
            case 2:
                ExplorationA()
            case 3:
                ExplorationB()
            case 4:
                ExplorationC()
            case 5:
                ExplorationD()
            case 6:
                ExplorationE()
            case 7:
                ThankYouView()
            default:
                Text("error: user went outside of page bounds")
            }
            
            HStack(spacing: 120) {
                
                if currentPage > 1 {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        
                        Text("Previous")
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.pink)
                            )
                        
                    })
                    .font(.title2)
                    .tracking(1)
                    .foregroundColor(.black)
                }
                
                
                
                if currentPage < 7{ 
                    Button(action: {
                        currentPage += 1
                    }, label: {
                        
                        if currentPage == 1 {
                            HStack {
                                HStack {
                                    Text("Begin Exploration")
                                    Image(systemName: "arrow.right")
                                }
                                
                            }
                            
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(LinearGradient(colors: [.cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            )
                        } else {
                            Text("Next")
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.green)
                                )
                            
                            
                        }
                    })
                        .font(.title2)
                        .tracking(1)
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 30)
        }
            
    }
}
