import SwiftUI


let columnLayout = Array(repeating:  GridItem(), count: 2)
struct ContentView: View {
    var body: some View {
        HStack{
            BasePallet()
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity)
        .background(BaseColor)
    }
}
