//
//  SwiftUIView.swift
//  
//
//  Created by OhSuhyun on 2023/03/28.
//

import SwiftUI

struct GetNumberView: View {
    @State var lettersShowing: Double = 0
    @State var textduration: Double = 1.0
    @State var refreshToken: Bool = false

    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    static let gradientStart = Color(red: 140.0 / 255, green: 89.0 / 255, blue: 181.0 / 255)
    static let gradientEnd = Color(red: 249 / 255, green: 227 / 255, blue: 255 / 255).opacity(0)
    
    // 이름
    let name = "신이 난 도모쿤♫~♪~!"
    // 대사
    @State var script = "끼얏호우~!! 나의 어필이 성공해버렸다죠!\n드디어 그녀의 번호가 내 손에 들어왔습니다만..?"
    // 배경화면
    let backgroundIamge = "BackgroundRoom"
    // 도모쿤 이미지
    let domoImage = "DomoHowl"

    var body: some View {
        ZStack {
            // 배경 사진
            Image(backgroundIamge)
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth, height: screenHeight)
            VStack {
                Spacer()
                // 도모쿤을 위한 자리
                HStack {
                    // 도모쿤 가운데 위치
                    Image(domoImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenHeight * 0.5)
                }
                // 대화창
                ZStack(alignment: .top) {
                    // 대화창 배경
                    Rectangle()
                        .fill(Color(red: 34 / 255, green: 6 / 255, blue: 56 / 255))
                        .opacity(0.72)
                        .onTapGesture {
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
                            // 리플레이 버튼
                            Button {
                                refreshToken = true
                                textduration = 0.5
                                lettersShowing = 0
                            } label: {
                                Text("REPLAY")
                                    .font(.custom(.DungGeunMo, size: 30))
                                    .foregroundColor(.white)
                                    .underline()
                                    .opacity(0.6)
                                    .padding(.trailing, screenWidth * 0.03)
                            }
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
                        .padding(.horizontal, screenWidth * 0.05)
                        .animation(.linear(duration: textduration), value: lettersShowing)
                    }
                    NextButton()
                        .position(x: 1160, y: 190)
                }
                .frame(width: screenWidth, height: screenHeight * 0.3)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct GetNumberView_Previews: PreviewProvider {
    static var previews: some View {
        GetNumberView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
