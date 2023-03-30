//
//  SwiftUIView.swift
//  
//
//  Created by 김영빈 on 2023/03/27.
//

import SwiftUI

struct CharacterField: View {
    @EnvironmentObject var user: UserSettings
    @State var character: String = ""
    @FocusState var focused: Int? // 원하는 TextField에 포커스가 갈 수 있도록 선언

    var index: Int // 몇 번째 CharacterField인지 식별하기 위한 인덱스
    var onChange: ((_ index: Int, _ char: String) -> Void) // 글자가 입력되거나 지워지면 다음 Field로 넘겨주기 위한 함수
    
    var body: some View {
        
        TextField(text: $character) {
            Text("") // placeholder
        }
        .lineLimit(1)
        .multilineTextAlignment(.center)
        .overlay(
            Rectangle()
                .frame(width: 52, height: 4)
                .offset(y: 30)
        )
        .font(.custom(.DungGeunMo, size: 40))
        .focused($focused, equals: index) // 인덱스 번호에 맞게 포커싱
        .onChange(of: character) { newValue in // 글자가 입력되거나 지워지면 onChange 호출
            onChange(index, character)
            // 여러 길이의 Text가 입력되어도 한 글자만 입력될 수 있도록 길이가 1보다 큰 String에 대해 앞글자만 저장
            if newValue.count > 1 {
                character = String(newValue[newValue.startIndex..<newValue.index(newValue.startIndex, offsetBy: 1)])
            }
            print("character: \(character), focused: \(focused!), index: \(index), user: \(user.nickname)") // 디버깅용
        }
        .foregroundColor(.white)
        .frame(width: 52)
        
    }
    
}

//struct CharacterField_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterField()
//    }
//}
