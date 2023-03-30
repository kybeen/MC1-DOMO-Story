//
//  SelectPosterView.swift
//
//
//  Created by Chaeeun Shin on 2023/03/28.
//

import NavigationStack
import SwiftUI

struct SelectPosterView: View {
    @EnvironmentObject var bgm: BGM
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack {
                Text("당신의 선택은..?")
                    .font(.custom(.DungGeunMo, size: 46))
                    .foregroundColor(.white)

                Spacer()
                    .frame(height: 58)

                VStack(spacing: 30) {
                    ForEach(SelectPosterList.allCases, id: \.self) { item in
                        PushView(destination: item.dstView) {
                            item.textItem
                                .font(.custom(.gulim, size: 40))
                                .shadow(color: .black.opacity(0.25), radius: 1, x: 2, y: 2)
                                .foregroundColor(.black)
                                .frame(width: UIScreen.main.bounds.width * 0.83, height: UIScreen.main.bounds.height * 0.15)
                                .background(
                                    LinearGradient(gradient: Gradient(
                                        colors: [Color(red: 86 / 255, green: 199 / 255, blue: 224 / 255), Color(red: 221 / 255, green: 210 / 255, blue: 173 / 255)]),
                                    startPoint: .top, endPoint: .bottom)
                                )
                                .cornerRadius(34)
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            bgm.selectEffect.play()
                        })
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct SelectPosterView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPosterView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(BGM())
    }
}
