//
//  SwiftUIView.swift
//  
//
//  Created by 김영빈 on 2023/03/29.
//

/* 둥근모 폰트와 흰색 글씨가 적용된 커스텀 Text */
import SwiftUI

struct MyText: View {
    var text: String // 텍스트 내용
    var fontSize: CGFloat // 폰트 크기
    var textColor: Color = .white // 텍스트 색상 (기본 흰색)
    
    var body: some View {
        Text(text)
            .font(.custom(.DungGeunMo, size: fontSize))
            .foregroundColor(textColor)
    }
}

struct MyText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            MyText(text: "테스트", fontSize: 100)
        }
    }
}
