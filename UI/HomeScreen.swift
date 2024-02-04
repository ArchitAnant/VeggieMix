import SwiftUI


struct HomeScreenView: View {
    @State var showStartup = true
    @State var sheetCode = 0
    @State var isPulse = false
    var body: some View {
        
        ZStack{
            backgroundVec()
//            SinglePulse()
                .offset(y: -280)
            HStack(alignment:.bottom){
                VeggieSection(){
                    isPulse.toggle()
                    print("Generate Pulse")
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
//        .sheet(isPresented: $showStartup, content: {
//                IntroSheet(onSkip:{
//                    showStartup.toggle()
//                },onNext: {
//                    sheetCode+=1
//                    print(sheetCode)
//                })
//            
//        })
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
