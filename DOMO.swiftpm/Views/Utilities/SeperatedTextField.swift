//
//  SwiftUIView.swift
//  
//
//  Created by 김영빈 on 2023/03/27.
//

import SwiftUI

struct SeperatedTextField: View {
    var length: Int // 입력받은 글자 수
    @FocusState var focused: Int?
    // index별로 글자를 저장할 dictionary
    @State var characters: [Int : String] = [:]

    @Binding var string: String
    
    var body: some View {
        HStack {
            ForEach(0..<length) { i in
                CharacterField(focused: _focused, index: i) { i, c in
                    focused = c.isEmpty ? i - 1 : i + 1
                    characters[i] = c
                    string = getString()
                }
            }
        }.padding([.vertical], 10)
    }
    
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
