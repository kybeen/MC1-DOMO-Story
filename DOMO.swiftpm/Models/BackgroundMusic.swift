//
//  BackgroundMusic.swift
//  DOMO
//
//  Created by 박상원 on 2023/03/30.
//

import Foundation
import SwiftySound

class BGM: ObservableObject {
    @Published var titleBGM: Sound = .init(url: Bundle.main.url(forResource: "start_background_music", withExtension: "mp3")!)!
    @Published var coinEffect: Sound = .init(url: Bundle.main.url(forResource: "coin_effect_music", withExtension: "mp3")!)!
    @Published var wrongBGM: Sound = .init(url: Bundle.main.url(forResource: "wrong_music", withExtension: "mp3")!)!
    @Published var firstBGM: Sound = .init(url: Bundle.main.url(forResource: "first_background_music", withExtension: "mp3")!)!
}
