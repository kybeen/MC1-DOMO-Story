//
//  SwiftUIView.swift
//  
//
//  Created by 김영빈 on 2023/03/27.
//

import SwiftUI

struct CharacterField: View {
    @State var character: String = ""
    @FocusState var focused: Int? // 원하는 TextField에 포커스가 갈 수 있도록 선언

    var index: Int // 몇 번째 CharacterField인지 식별하기 위한 인덱스
    var onChange: ((_ index: Int, _ char: String) -> Void) // 글자가 입력되거나 지워지면 다음 Field로 넘겨주기 위한 함수
    
    var body: some View {
        
        TextField(text: $character) {
            Text("")
        }
        .lineLimit(1)
        .multilineTextAlignment(.center)
        .overlay(
            Rectangle()
                .frame(width: 50, height: 3)
                .offset(y: 20)
        )
        .font(.custom(.DungGeunMo, size: 30))
        .focused($focused, equals: index)
        .onChange(of: character) { newValue in
            onChange(index, character)

            if newValue.count > 1 {
                character = String(newValue[newValue.startIndex..<newValue.index(newValue.startIndex, offsetBy: 1)])
            }
        }
        .foregroundColor(.white)
        .frame(width: 50)
        //.background(.green)
        
        
    }
    
}

//struct CharacterField_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterField()
//    }
//}
