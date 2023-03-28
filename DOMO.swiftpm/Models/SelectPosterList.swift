//
//  SelectPosterList.swift
//  
//
//  Created by Chaeeun Shin on 2023/03/28.
//

import SwiftUI

enum SelectPosterList: CaseIterable {
    case cute
    case power
    case hip
    case marry
    
    var textItem: Text {
        switch self {
        case .cute: return Text("『초절정 귀여움』을 보여주지")
        case .power: return Text("박려크…")
        case .hip: return Text("나의 힙함을 보여주는 것쯤은 완전 - 여유 - 다.")
        case .marry: return Text("밀당은 없다 너 하나쯤은 내가 보살펴주마")
        }
    }
    
    var dstView: some View {
        switch self {
        case .cute: return Text("hi")
        case .power: return Text("hi")
        case .hip: return Text("hi")
        case .marry: return Text("hi")
        }
    }
    
//    var imageItem: Image {
//        switch self {
//        case .cute: return Image("hi")
//        case .power: return Image("hi")
//        case .hip: return Image("hi")
//        case .marry: return Image("hi")
//        }
//    }
}
