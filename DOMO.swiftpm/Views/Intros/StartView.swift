//
//  SwiftUIView.swift
//  
//
//  Created by 김영빈 on 2023/03/28.
//

/* 닉네임 입력 완료 후 시작 화면 뷰 */
import SwiftUI

struct StartView: View {
    @EnvironmentObject var user: UserSettings
    
    var body: some View {
        Text("TEST \(user.nickname)")
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(UserSettings())
    }
}
