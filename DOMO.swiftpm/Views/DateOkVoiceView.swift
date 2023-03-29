import SwiftUI

struct DateOkVoiceView: View {

    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    static let gradientStart = Color(red: 140.0 / 255, green: 89.0 / 255, blue: 181.0 / 255)
    static let gradientEnd = Color(red: 249 / 255, green: 227 / 255, blue: 255 / 255).opacity(0)
    @State var text: String = ""
    // 이름
    let name = "????"
    // 대사
    let script = "좋아요! 그럼 내일 C5 앞에서 볼까요? (여자 음성)"

    var body: some View {
        ZStack {
            // 배경 사진
            Image("BackgroundHeart")
                .resizable()
                .scaledToFill()
            VStack {
                Spacer()
                // 도모쿤을 위한 자리
                HStack {
                    Spacer()
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(width:665, height:600)
                        .position(x:300, y:600)
                }
                // 대화창
                ZStack(alignment: .top) {
                    // 대화창 배경
                    Rectangle()
                        .fill(Color(red: 6 / 255, green: 44 / 255, blue: 56 / 255))
                        .opacity(0.72)
                        .onTapGesture {}
                    VStack(alignment: .leading, spacing: 0) {
                        // 대화창 상단
                        HStack {
                            // 이름
                            Text(name)
                                .font(.custom(.DungGeunMo, size: 40))
                                .foregroundColor(.white)
                                .padding(.leading, screenWidth * 0.05)
                            Spacer()
                            // 리플레이 버튼
                            Button {
                                typeWriter()
                            } label: {
                                Text("REPLAY")
                                    .font(.custom(.DungGeunMo, size: 30))
                                    .foregroundColor(.white)
                                    .underline()
                                    .opacity(0.6)
                                    .padding(.trailing, screenWidth * 0.03)
                            }
                        }
                        .padding(.vertical, screenHeight * 0.03)
                        // Divider
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                                startPoint: .init(x: 0, y: 0),
                                endPoint: .init(x: 1, y: 0)
                            ))
                            .frame(width: screenWidth * 0.5, height: screenHeight * 0.015)
                            .padding(.bottom, screenHeight * 0.03)
                            .onAppear {
                                typeWriter()
                            }
                        // 대사
                        Text(text)
                            .font(.custom(.gulim, size: 35))
                            .lineSpacing(10.0)
                            .foregroundColor(.white)
                            .padding(.horizontal, screenWidth * 0.05)
                    }
                }
                .frame(width: screenWidth, height: screenHeight * 0.3)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }

    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < script.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                text.append(script[position])
                typeWriter(at: position + 1)
            }
        }
    }
}

struct Previews_DateOkVoiceView_Previews: PreviewProvider {
    static var previews: some View {
        DateOkVoiceView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

//extension String {
   // subscript(offset: Int) -> Character {
       // self[index(startIndex, offsetBy: offset)]
 //   }
//}
