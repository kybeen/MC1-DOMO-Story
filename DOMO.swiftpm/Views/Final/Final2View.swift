//
//  Final2View.swift
//
//
//  Created by Chaeeun Shin on 2023/03/30.
//

import NavigationStack
import SwiftUI

struct Final2View: View {
    @State var lettersShowing: Double = 0
    @State private var textduration: Double = 1.0
    @State var refreshToken: Bool = false
    @EnvironmentObject var bgm: BGM
    let logoImage = "Success"
    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    let backgroundIamge = "BackgroundFlower"
    let name = " "
    @State private var isButtonVisible = false
    static let mintColor = Color(red: 66 / 255, green: 255 / 255, blue: 232 / 255)

    var body: some View {
        ZStack {
            // 배경 사진
            Image(backgroundIamge)
                .resizable()
                .scaledToFill()
                .frame(height: screenHeight)
                .onAppear{
                    bgm.happyEffect.volume = 0.5
                    isButtonVisible = true
                }
            Color.black
                .opacity(0.6)
            VStack {
                Image(logoImage)
                PushView(destination: MemberView()) {
                    Text("The end ...")
                        .font(.custom(.DungGeunMo, size: 70))
                        .foregroundColor(Self.mintColor)
                }
            }
            .offset(y: isButtonVisible ? 0 : 600)
            .animation(.easeInOut(duration: 1.5), value: isButtonVisible)
            .onAppear {
                isButtonVisible = true
                bgm.successEffect.play()
            }
        }
        .ignoresSafeArea()
    }
}

struct Final2View_Previews: PreviewProvider {
    static var previews: some View {
        Final2View()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(BGM())
    }
}
