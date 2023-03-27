import SwiftUI

struct ContentView: View {
    let radius = 30.0
    var body: some View {
        ZStack {
            Image("rabbit")
                .resizable()
                .scaledToFill()
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color(red: 34 / 255, green: 6 / 255, blue: 56 / 255))
                        .frame(height: 250)
                        .padding(.bottom, -radius)
                        .opacity(0.72)
                    VStack{
                        //둥근모 체
                        Text("안녕하세요")
                            .font(.custom(.DungGeunMo, size: 40))
                            .foregroundColor(.white)
                        //굴림체
                        Text("안녕하세요")
                            .font(.custom(.gulim, size: 40))
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

