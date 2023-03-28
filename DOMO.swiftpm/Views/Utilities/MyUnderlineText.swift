//
//  SwiftUIView.swift
//  
//
//  Created by 김영빈 on 2023/03/29.
//

import SwiftUI

struct MyUnderlineText: View {
    @State private var isButtonAnimating = false // 버튼 깜빡거리는 효과를 위한 state변수
    
    var text: String // 텍스트 내용
    var fontSize: CGFloat // 폰트 크기
    var arrowColor: Color = .gray // >>> 화살표 색상
    var textColor: Color = .white // 텍스트 색상 (기본 흰색)
    var underlineLen: CGFloat // 밑줄 길이
    var isBtnAnimating: Bool // 버튼 깜빡이 여부
    
    var body: some View {
        HStack {
            Text(">>>")
                .foregroundColor(arrowColor)
                .padding(.trailing, 10)
            Text(text)
                // 밑줄 그어주기
                .overlay(
                    Rectangle()
                        .frame(width: underlineLen, height: 3) // width 텍스트 길이에 맞게 수정 필요
                        .offset(y: 20)
                )
                .foregroundColor(textColor)
                .opacity(isButtonAnimating ? 0.0 : 1.0)
                .onAppear {
                    if (isBtnAnimating == true) { // isBtnAnimating이 true일때만 깜빡이 효과
                        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { timer in
                            isButtonAnimating.toggle()
                        }
                    }
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
                underlineLen: 380,
                isBtnAnimating: true
            )
        }
    }
}
