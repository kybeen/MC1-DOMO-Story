//
//  SwiftUIView.swift
//  
//
//  Created by 김영빈 on 2023/03/27.
//

import SwiftUI

struct SeperatedTextField: View {
    var length: Int // 입력받을 글자 수
    @FocusState var focused: Int?
    @State var prevCursor: Int? // 이전 인덱스의 커서
    @State var characters: [Int : String] = [:] // index별로 글자를 저장할 dictionary
    @Binding var string: String // InformationView의 $nickname에 대한 바인딩 변수
    
    var body: some View {
        HStack {
            ForEach(0 ..< length) { i in // length 만큼 CharacterField()를 생성해줌
                CharacterField(
                    focused: _focused,
                    index: i,
                    onChange: { i, c in
                        focused = c.isEmpty ? i - 1 : i + 1
                        characters[i] = c
                        string = getString()
                    }
                )
            }
        }.padding([.vertical], 10)
    }
    
    // characters 딕셔너리에 저장된 글자들을 string으로 변환해주는 함수
    func getString() -> String {
        var str = ""
        for i in 0..<length {
            if let c = characters[i] {
                str += c
            }
        }
        return str
    }
    
}

//struct SeperatedTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        SeperatedTextField()
//    }
//}
