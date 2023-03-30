//
//  SwiftUIView.swift
//  
//
//  Created by 김영빈 on 2023/03/29.
//

import SwiftUI

struct MyUnderlineText: View {
    @State private var isButtonAnimating = false // 버튼 깜빡거리는 효과를 위한 state변수
    @State var timer: Timer?
    
    var text: String // 텍스트 내용
    var fontSize: CGFloat // 폰트 크기
    var arrowColor: Color = .gray // >>> 화살표 색상
    var textColor: Color = .white // 텍스트 색상 (기본 흰색)
    var isBtnAnimating: Bool // 버튼 깜빡이 여부
    
    var body: some View {
        HStack {
            Text(">>>")
                .foregroundColor(arrowColor)
                .padding(.trailing, 10)
            Text(text)
                .underline() // 밑줄 그어주기
                .foregroundColor(textColor)
                .opacity(isButtonAnimating ? 0.01 : 1.0)
                .onAppear {
                    if (isBtnAnimating == true) { // isBtnAnimating이 true일때만 깜빡이 효과
                        timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { timer in
                            isButtonAnimating.toggle()
                        }
                    }
                }
                .onDisappear { // 뷰가 사라질 때 타이머 취소 (타이머 중첩 방지)
                    if let t: Timer = timer {
                        t.invalidate()
                    }
                    //timer?.invalidate()
                }
        }
        .font(.custom(.DungGeunMo, size: fontSize))
    }
    
}

struct MyUnderlineText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            MyUnderlineText(
                text: "아니. 왜요? (시작하기)",
                fontSize: 30,
                arrowColor: Color("TitleColor"),
                textColor: .white,
                isBtnAnimating: true
            )
        }
    }
}
