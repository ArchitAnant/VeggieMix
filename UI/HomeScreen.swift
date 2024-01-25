import SwiftUI


struct HomeScreenView: View {
    @State var showStartup = true
    var body: some View {
        
        ZStack{
            backgroundVec()
            HStack(alignment:.bottom){
                VeggieSection()
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
        .sheet(isPresented: $showStartup, content: {
            IntroSheet(){
                showStartup.toggle()
            }
        })
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
