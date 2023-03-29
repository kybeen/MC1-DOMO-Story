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
        case .cute: return PosterDisplayView(name: "귀여운 도모쿤♫~♪~!", poster: Image("PosterPicnic"), script: "『초절정 귀여움』을 보여주지")
        case .power: return PosterDisplayView(name: "박력있는 도모쿤♫~♪~!", poster: Image("PosterDomo"), script: "크아앙..")
        case .hip: return PosterDisplayView(name: "힙스터 도모쿤♫~♪~!", poster: Image("PosterBlue"), script: "나의 힙함을 보여주는 것쯤은 완전 - 여유 - 다.")
        case .marry: return PosterDisplayView(name: "러블리 도모쿤♫~♪~!", poster: Image("PosterMarry"), script: "밀당은 없다 너 하나쯤은 내가 보살펴주마")
        }
    }
}
