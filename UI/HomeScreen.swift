import SwiftUI


struct HomeScreenView: View {
    @State private var elapsedTime: TimeInterval = 0
    @State var showStartup = true
    @State var sheetCode = 0
    @State var isPulse = false
    @State var showOvelay = false
    
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    Circle()
                        .foregroundColor(fontColor)
                        .frame(width: 100 )
                        .scaleEffect(isPulse ? 1.5 : 1)
                        .animation(
                                .easeInOut.speed(0.5).repeatCount(1,autoreverses: true),
                                value: isPulse
                        )
                    Circle()
                        .stroke(fontColor,lineWidth:3)
                        .frame(width: 200)
                        .scaleEffect(isPulse ? 2 : 1)
                        .opacity(isPulse ? 0.2 : 1)
                        .animation(
                            .easeInOut.speed(0.5).repeatCount(1,autoreverses: true),
                                    value: isPulse
                        )
                    Circle()
                        .stroke(fontColor,lineWidth:3)
                        .frame(width: 150)
                        .scaleEffect(isPulse ? 1.5 : 1)
                        .opacity(isPulse ? -0.5 : 1)
                        .animation(.easeInOut.speed(0.5).repeatCount(1,autoreverses: true),
                                    value: isPulse
                        )
                    Rectangle()
                        .foregroundColor(fontColor)
                        .frame(width: 500 , height: 2)
                }
                
                backgroundVec()
                HStack(alignment:.bottom){
                    VeggieSection(){
                        isPulse = true
                        startVeggieTimer()
                    }
                    BasePallet()
                }
                .frame(minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .bottom
                )
                .padding()
            }
            
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity)
            .background(BaseColor)
            .overlay(content: {
                if showOvelay{
                    Rectangle()
                        .opacity(0.4)
                        .ignoresSafeArea()
                }
            })
                    .sheet(isPresented: $showStartup, content: {
                            IntroSheet(onSkip:{
                                showStartup.toggle()
                            },onNext: {
                                sheetCode+=1
                                print(sheetCode)
                            },letsRock: {
                                showOvelay = true
                            })
            
                    })
            HStack{
                Button(action :{
                    showOvelay.toggle()
                }){
                    Image(systemName: "book")
                        .font(.title)
                        .foregroundColor(fontColor)
                        
                        .padding([.trailing],30)
                        .padding([.top],10)
                }
            }
            .frame(maxWidth: .infinity,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .topTrailing)
        }
    }
    private func startVeggieTimer() {
        // carrot - delay = 5, repeatCount = 11
        // pepper - delay = 1, repeatCount = 3
        // restSmall - delay = 0.3, repeatCount = 1
        
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            elapsedTime += 1
            if elapsedTime >= 0.3 {
                timer.invalidate() // Stop the timer
                isPulse = false
            }
        }
    }
    
}

struct backgroundVec : View{
    var body: some View{
        HStack{
            Image("BgCircle")
                .offset(x: -165,y: 80)
                .frame(alignment: .bottomLeading)
            Image("BgStrip")
                .frame(alignment: .bottomTrailing)
                .offset(x:100,y: 330)
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity

              )
    }
}

#Preview {
    HomeScreenView()
}
