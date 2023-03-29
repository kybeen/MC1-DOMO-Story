//
//  SplashView.swift
//  DOMO
//
//  Created by 박상원 on 2023/03/27.
//

import SwiftUI
import NavigationStack

struct SplashView: View {
    var body: some View {

        NavigationStackView(transitionType: .none) {
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
