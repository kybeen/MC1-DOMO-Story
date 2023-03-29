//
//  SelectionSample.swift
//  DOMO
//
//  Created by Chaeeun Shin on 2023/03/28.
//

import SwiftUI

enum SelectionDate: CaseIterable {
    case game
    case business
    case burger
    case coffee
    
    var textItem: Text {
        switch self {
        case .game: return Text("당신, 『오바-와치』를 좋아한다죠?")
        case .business: return Text("같이 사업을 하게 되면 초절정 멋질 것 같습니다만. ")
        case .burger: return Text("수지스 버거가 오이시 하다더군요.")
        case .coffee: return Text("당신과 커피가 마시고 싶어졌다...랄까?")
        }
    }
}

