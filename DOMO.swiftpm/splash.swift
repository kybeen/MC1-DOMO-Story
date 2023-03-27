//
//  splash.swift
//  DOMO
//
//  Created by 박상원 on 2023/03/27.
//

import SwiftUI

struct splash: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                ContentView()
            } label: {
                Text("시작하기")
                    .font(.largeTitle)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct splash_Previews: PreviewProvider {
    static var previews: some View {
        splash()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
