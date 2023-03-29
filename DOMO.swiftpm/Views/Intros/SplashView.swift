//
//  SplashView.swift
//  DOMO
//
//  Created by 박상원 on 2023/03/27.
//

/* 타이틀 화면 내비게이션 뷰 */
import SwiftUI
import NavigationStack

struct SplashView: View {
    var body: some View {
        NavigationStackView(transitionType: .custom(.identity)) {
            PushView(destination: InformationView()) {
                TitleView()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(UserSettings())
    }
}
