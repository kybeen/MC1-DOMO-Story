//
//  SwiftUIView.swift
//
//
//  Created by OhSuhyun on 2023/03/28.
//

import NavigationStack
import SwiftUI

struct SelectionContactView: View {
    @EnvironmentObject var bgm: BGM
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack {
                Text("자, 이제 그녀에게 어떻게 연락할까..?")
                    .font(.custom(.DungGeunMo, size: 46))
                    .foregroundColor(.white)

                Spacer()
                    .frame(height: 58)

                VStack(spacing: 30) {
                    // 선택지 1 -> ContactImessageView
                    PushView(destination: ContactImessageView()) {
                        Text("내가 선톡을 하는 영광을 너에게 주도록 하지")
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
                    // 선택지 2 -> ContactCallingView
                    PushView(destination: ContactCallingView()) {
                        Text("아니 통화버튼을 누르지 않고 무얼 하고 있는거야!!")
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
                        bgm.selectEffect.play{ completed in
                            bgm.wrongBGM.play()
                        }
                    })
                    // 선택지 3 -> ContactSnsView
                    PushView(destination: ContactSnsView()) {
                        Text("카톡 프로필로 그녀가 어디 사는 지 알아내보자-!")
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
                        bgm.selectEffect.play{ completed in
                            bgm.wrongBGM.play()
                        }
                    })
                    // 선택지 4 -> ContactNothingView
                    PushView(destination: ContactNothingView()) {
                        Text("(털썩..) 그녀는 이 밤에 곤히 자고 말거야…")
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
                        bgm.selectEffect.play{ completed in
                            bgm.failedEffect.play()
                        }
                    })
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct SelectionContactView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionContactView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(BGM())
    }
}
