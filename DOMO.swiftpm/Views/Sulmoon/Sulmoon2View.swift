//
//  SwiftUIView.swift
//
//
//  Created by 박상원 on 2023/03/28.
//

import NavigationStack
import SwiftUI

struct Sulmoon2View: View {
    @State var lettersShowing: Double = 0
    @State var textduration: Double = 1.0
    @State var refreshToken: Bool = false
    @EnvironmentObject var bgm: BGM

    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    static let gradientStart = Color(red: 140.0 / 255, green: 89.0 / 255, blue: 181.0 / 255)
    static let gradientEnd = Color(red: 249 / 255, green: 227 / 255, blue: 255 / 255).opacity(0)

    // 이름
    let name = "도모쿤♫~♪~!"
    // 대사
    @State var script = "(카페테리아에 앉아 담소를 나누는 그녀에게 다가간다)"
    // 배경화면
    let backgroundIamge = "BackgroundTable"
    // 도모쿤 이미지
    let domoImage = "DomoHuck"

    var body: some View {
        ZStack {
            // 배경 사진
            Image(backgroundIamge)
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(domoImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenHeight * 0.82)
                        .padding(.trailing, 10)
                        .padding(.bottom, 80)
                }
            }
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
                            lettersShowing += Double(script.count)
                            refreshToken = false
                        }
                    VStack(alignment: .leading, spacing: 0) {
                        // 대화창 상단
                        HStack {
                            // 이름
                            Text(name)
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
                            PushView(destination: Sulmoon3View()) {
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
                                textduration = 3.0
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
                        .padding(.leading, screenWidth * 0.05)
                        .padding(.trailing, screenWidth * 0.04)
                        .animation(.linear(duration: textduration), value: lettersShowing)
                    }
                }
                .frame(width: screenWidth, height: screenHeight * 0.3)
            }
        }
        .ignoresSafeArea()
    }
}

struct Sulmoon2View_Previews: PreviewProvider {
    static var previews: some View {
        Sulmoon2View()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(BGM())
    }
}
