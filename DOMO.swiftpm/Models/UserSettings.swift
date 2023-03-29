//
//  File.swift
//  
//
//  Created by 김영빈 on 2023/03/28.
//

/* 사용자 정보 저장 모델 */
import Foundation

class UserSettings: ObservableObject {
    @Published var nickname: String = ""
}
