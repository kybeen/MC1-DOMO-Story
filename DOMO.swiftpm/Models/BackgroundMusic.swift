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
    @Published var happyEffect: Sound = .init(url: Bundle.main.url(forResource: "domo_happy_music", withExtension: "mp3")!)!
    @Published var speakEffect: Sound = .init(url: Bundle.main.url(forResource: "domo_speak_music", withExtension: "mp3")!)!
    @Published var girlLaughEffect: Sound = .init(url: Bundle.main.url(forResource: "girl_laugh", withExtension: "mp3")!)!
    @Published var loveEffect: Sound = .init(url: Bundle.main.url(forResource: "love_effect", withExtension: "mp3")!)!
    @Published var posterEffect: Sound = .init(url: Bundle.main.url(forResource: "show_poster_music", withExtension: "mp3")!)!
    @Published var successEffect: Sound = .init(url: Bundle.main.url(forResource: "success_effect", withExtension: "mp3")!)!
    @Published var fellLoveEffect: Sound = .init(url: Bundle.main.url(forResource: "fell_love_effect", withExtension: "mp3")!)!
    @Published var questionEffect: Sound = .init(url: Bundle.main.url(forResource: "question_effect", withExtension: "mp3")!)!
    @Published var decisionEffect: Sound = .init(url: Bundle.main.url(forResource: "decision_effect", withExtension: "mp3")!)!
    @Published var sayLoveEffect: Sound = .init(url: Bundle.main.url(forResource: "saylove_effect", withExtension: "mp3")!)!
    @Published var girlOKEffect: Sound = .init(url: Bundle.main.url(forResource: "girl_date_effect", withExtension: "mp3")!)!
    @Published var walkEffect: Sound = .init(url: Bundle.main.url(forResource: "walk_effect", withExtension: "mp3")!)!
    @Published var girlPosterEffect: Sound = .init(url: Bundle.main.url(forResource: "girl_poster_effect", withExtension: "mp3")!)!
    @Published var girlGOEffect: Sound = .init(url: Bundle.main.url(forResource: "girl_GO_effect", withExtension: "mp3")!)!

    @Published var failedBGM: Sound = .init(url: Bundle.main.url(forResource: "domo_failed_trimmed", withExtension: "m4a")!)! // 실패 BGM

    @Published var buttonEffect: Sound = .init(url: Bundle.main.url(forResource: "button_effect_music", withExtension: "mp3")!)!
    @Published var cancelEffect: Sound = .init(url: Bundle.main.url(forResource: "intro_cancel_effect", withExtension: "mp3")!)! // 취소 버튼 효과음
    @Published var keyboardEffect: Sound = .init(url: Bundle.main.url(forResource: "keyboard_effect", withExtension: "mp3")!)! // 키보드 효과음
    @Published var okEffect: Sound = .init(url: Bundle.main.url(forResource: "ok_effect", withExtension: "mp3")!)! // 확인 버튼 효과음
    @Published var decideEffect: Sound = .init(url: Bundle.main.url(forResource: "decide_effect", withExtension: "mp3")!)! // 닉네임 결정 버튼 효과음
    @Published var yahoEffect: Sound = .init(url: Bundle.main.url(forResource: "yaho_effect", withExtension: "mp3")!)! // 끼얏호 효과음
    @Published var selectEffect: Sound = .init(url: Bundle.main.url(forResource: "select_effect_music", withExtension: "mp3")!)! // 선택지 결정 버튼 효과음
    @Published var runningEffect: Sound = .init(url: Bundle.main.url(forResource: "running_domo_music", withExtension: "mp3")!)! // 닉네임 결정 버튼 효과음
    @Published var failedEffect: Sound = .init(url: Bundle.main.url(forResource: "domo_failed_music", withExtension: "m4a")!)! // 잘못된 선택지 결정 버튼 효과음
}
