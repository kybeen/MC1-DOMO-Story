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
        case .cute: return PosterDisplayView(name: "귀여운 도모쿤♫~♪~!", poster: Image("PosterPicnic"), script: "후우훗. 귀여운 건 질리지 않는다고 하더군요.")
        case .power: return PosterDisplayView(name: "박력있는 도모쿤♫~♪~!", poster: Image("PosterDomo"), script: "박려크아아아아아아앙!\n쿠쿠. 벌써 얼.어.버.린.건.가?")
        case .hip: return PosterDisplayView(name: "힙스터 도모쿤♫~♪~!", poster: Image("PosterBlue"), script: "『초궁극의 멋』을 가진 나 도모쿤에게 와주면 좋겠습니다만?")
        case .marry: return PosterDisplayView(name: "러블리 도모쿤♫~♪~!", poster: Image("PosterMarry"), script: "나 도모쿤이랑 결혼하면 행복은 보장된 것. 셋 셀테니 대답해주시죠?\n하나. 둘. 둘 반의 반...반의 반의 반.... 반의 반의 당근당근☆")
        }
    }
}
