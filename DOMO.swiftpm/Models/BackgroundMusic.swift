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
    @Published var secondBGM: Sound = .init(url: Bundle.main.url(forResource: "second_background_music", withExtension: "mp3")!)!
    @Published var buttonEffect: Sound = .init(url: Bundle.main.url(forResource: "button_effect_music", withExtension: "mp3")!)!
    @Published var handEffect: Sound = .init(url: Bundle.main.url(forResource: "hand_effect_music", withExtension: "mp3")!)!
    @Published var cancelEffect: Sound = .init(url: Bundle.main.url(forResource: "intro_cancel_effect", withExtension: "mp3")!)! // 취소 버튼 효과음
    @Published var keyboardEffect: Sound = .init(url: Bundle.main.url(forResource: "keyboard_effect", withExtension: "mp3")!)! // 키보드 효과음
    @Published var okEffect: Sound = .init(url: Bundle.main.url(forResource: "ok_effect", withExtension: "mp3")!)! // 확인 버튼 효과음
    @Published var decideEffect: Sound = .init(url: Bundle.main.url(forResource: "decide_effect", withExtension: "mp3")!)! // 닉네임 결정 버튼 효과음
    @Published var yahoEffect: Sound = .init(url: Bundle.main.url(forResource: "yaho_effect", withExtension: "mp3")!)! // 끼얏호 효과음
}
