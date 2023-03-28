//
//  SwiftUIView.swift
//  
//
//  Created by OhSuhyun on 2023/03/28.
//

import SwiftUI

enum SelectionContactModel: CaseIterable {
    case imessage
    case calling
    case sns
    case nothing
    
    var textItem: Text {
        switch self {
        case .imessage: return Text("내가 선톡을 하는 영광을 너에게 주도록 하지")
        case .calling: return Text("아니 통화버튼을 누르지 않고 무얼 하고 있는거야!!")
        case .sns: return Text("그녀의 카톡 프로필 나에게 보여져버렷!.")
        case .nothing: return Text("(털썩..) 그녀는 이 밤에 곤히 자고 말거야…")
        }
    }
    
    var dstView: some View {
        switch self {
        case .imessage: return Text("hi")
        case .calling: return Text("hi")
        case .sns: return Text("hi")
        case .nothing: return Text("hi")
        }
    }
}
