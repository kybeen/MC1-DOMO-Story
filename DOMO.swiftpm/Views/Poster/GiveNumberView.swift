//
//  GiveNumberView.swift
//
//
//  Created by Chaeeun Shin on 2023/03/29.
//

import NavigationStack
import SwiftUI

struct GiveNumberView: View {
    @State var lettersShowing: Double = 0
    @State private var textduration: Double = 1.0
    @State var refreshToken: Bool = false
    @EnvironmentObject var bgm: BGM

    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    static let gradientStart = Color(red: 140.0 / 255, green: 89.0 / 255, blue: 181.0 / 255)
    static let gradientEnd = Color(red: 249 / 255, green: 227 / 255, blue: 255 / 255).opacity(0)
    let backgroundIamge = "BackgroundMain"
    let domoImage = "DomoStand"
    // 이름, 포스터, 대사 입력받기
    var poster: Image
    var script: String
    var body: some View {
        ZStack {
            // 배경 사진
            Image(backgroundIamge)
                .resizable()
                .scaledToFill()
                .frame(height: screenHeight)
                .onAppear {
                    bgm.girlPosterEffect.play()
                    bgm.happyEffect.volume = 0.5
                }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image(domoImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenHeight * 0.5)
                }
                .padding(.bottom, 171)
            }
            .padding(.trailing, 45)

            Color.black
                .opacity(0.7)

            VStack {
                Spacer()
                poster
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenHeight * 0.55)
            }
            .padding(.bottom, 320)

            VStack {
                Spacer()

                // 대화창
                ZStack(alignment: .top) {
                    // 대화창 배경
                    Rectangle()
                        .fill(Color(red: 34 / 255, green: 6 / 255, blue: 56 / 255))
                        .opacity(0.72)
                        .onTapGesture {
                            bgm.buttonEffect.play()
                            textduration = refreshToken ? 3.0 : 1.0
                            bgm.happyEffect.volume = refreshToken ? 0.5 : 0.0
                            lettersShowing += Double(script.count)
                            refreshToken = false
                        }
                    VStack(alignment: .leading, spacing: 0) {
                        // 대화창 상단
                        HStack {
                            // 이름
                            Text("매력에 빠져버린 그녀!?!")
                                .font(.custom(.DungGeunMo, size: 40))
                                .foregroundColor(.white)
                                .padding(.leading, screenWidth * 0.05)
                            Spacer()
                            BackButton()
                                .simultaneousGesture(TapGesture().onEnded {
                                    bgm.buttonEffect.play()
                                })
                            // 리플레이 버튼
                            Button {
                                bgm.buttonEffect.play()
                                refreshToken = true
                                textduration = 0.5
                                lettersShowing = 0
                            } label: {
                                ScriptButtonText(text: "REPLAY")
                                    .padding(.trailing, screenWidth * 0.02)
                            }
                            PushView(destination: GetNumberView()) {
                                ScriptButtonText(text: "NEXT")
                                    .padding(.trailing, screenWidth * 0.02)
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                bgm.buttonEffect.play()
                            })
                        }
                        .padding(.vertical, screenHeight * 0.03)
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                                startPoint: .init(x: 0, y: 0),
                                endPoint: .init(x: 1, y: 0)
                            ))
                            .frame(width: screenWidth * 0.5, height: screenHeight * 0.015)
                            .padding(.bottom, screenHeight * 0.03)
                            .onAppear {
                                textduration = 2.5
                                lettersShowing += Double(script.count)
                            }
                        // 대사
                        AppearingText(
                            fullText: script,
                            numberOfLettersShow: lettersShowing,
                            font: .custom(.gulim, size: 35)
                        )
                        .lineSpacing(10.0)
                        .foregroundColor(.white)
                        .fixedSize()
                        .padding(.horizontal, screenWidth * 0.05)
                        .animation(.linear(duration: textduration), value: lettersShowing)
                    }
                }
                .frame(width: screenWidth, height: screenHeight * 0.3)
            }
        }
        .ignoresSafeArea()
    }
}

struct GiveNumberView_Previews: PreviewProvider {
    static var previews: some View {
        GiveNumberView(poster: Image("PosterPicnic"), script: "꺄아앗! 도모쿤의 궁극의 멋짐에 빠져버렷~!~@!\n(전화번호를 준다)")
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(BGM())
    }
}
