//
//  SplashView.swift
//  DOMO
//
//  Created by 박상원 on 2023/03/27.
//

/* 타이틀 화면 내비게이션 뷰 */
import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: InformationView()) {
                TitleView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(UserSettings())
    }
}
