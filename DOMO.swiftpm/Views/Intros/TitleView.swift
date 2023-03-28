//
//  TitleView.swift
//  domoTest
//
//  Created by 김영빈 on 2023/03/27.
//

/* 타이틀 화면 */
import SwiftUI

struct TitleView: View {
    @State private var isAnimating = false // 깜빡거리는 효과를 위한 state변수
    
    var body: some View {
        ZStack {
            Color("TitleColor")
            
            VStack {
                Spacer()
                
                Image("domo_title1")
                    .opacity(isAnimating ? 0.3 : 1.0) // isAnimating값에 따라 투명도 변함
                    .onAppear { // 1초마다 타이머 동작하면서 isAnimating값 변경
                        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { timer in
                            isAnimating.toggle()
                        }
                    }
                
                Text("TAP TO START")
                    .font(.custom(.DungGeunMo, size: 30))
                    .padding(.top, 40)
                    .foregroundColor(.white)
                
                Text("\" 너가 내 처음이닷 \"")
                    .font(.custom(.DungGeunMo, size: 40))
                    .padding(.top, 40)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("2023 © Team First Dot // All Rights Reserved")
                    .font(.custom(.DungGeunMo, size: 20))
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
