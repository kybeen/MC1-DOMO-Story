//
//  TitleView.swift
//  domoTest
//
//  Created by 김영빈 on 2023/03/27.
//

// 타이틀 화면
import AVFoundation
import SwiftUI
import SwiftySound

struct TitleView: View {
    @State private var isAnimating = false // 깜빡거리는 효과를 위한 state변수
    @EnvironmentObject var bgm: BGM
    
    var body: some View {
        ZStack {
            Color("TitleColor")

            VStack {
                Image("domo_title1")
                    .opacity(isAnimating ? 0.3 : 1.0) // isAnimating값에 따라 투명도 변함
                    .onAppear { // 1초마다 타이머 동작하면서 isAnimating값 변경
                        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { _ in
                            isAnimating.toggle()
                        }
                        bgm.titleBGM.play()
                        bgm.firstBGM.volume = 0.4
                    }
                    .padding(.top, 100)
                    .padding(.bottom, 42)

                MyText(text: "TAP TO START", fontSize: 28)
                    .padding(.bottom, 74)
                    .foregroundColor(.white)
                    .onDisappear {
                        bgm.coinEffect.play()
                    }

                MyText(text: "\" 너가 내 처음이닷 \"", fontSize: 40)
                    .padding(.bottom, 30)
                    .foregroundColor(.white)

                MyText(text: "2023 © Team First Dot // All Rights Reserved", fontSize: 20)
                    .padding(.bottom, 50)
            }
        }
        .ignoresSafeArea()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(BGM())
    }
}
