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
                .opacity(showOvelay ? 0.3 : 1)
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: showOvelay)
                
                backgroundVec()
                    .brightness(showOvelay ? -1 : 0)
                    .animation(.easeInOut, value: showOvelay)
                HStack(alignment:.bottom){
                    VeggieSection(){
                        isPulse = true
                        startVeggieTimer()
                    }
                    ZStack{
                        BasePallet()
                            .opacity(showOvelay ? 0.3 : 1)
                            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: showOvelay)
                    }
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
            VStack{
                Button(action :{
                    showOvelay.toggle()
                }){
                    Image(systemName: "book")
                        .font(.title)
                        .foregroundColor(fontColor)
                        .frame(alignment: .trailing)
                        .padding([.trailing],showOvelay ? 0 : 30)
                        .padding([.top],10)
                }
                .animation(.spring, value: showOvelay)
                if showOvelay{
                    Demo()

                        .frame(width: UIScreen.main.bounds.width/2.13)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                        .padding()
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: showOvelay)
                }
            }
            .frame(maxWidth: .infinity,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .topTrailing)
        }
    }
    private func startVeggieTimer() {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            elapsedTime += 1
            if elapsedTime >= 0.3 {
                timer.invalidate()
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
