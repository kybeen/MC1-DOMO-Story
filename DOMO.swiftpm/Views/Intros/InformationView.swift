//
//  InformationView.swift
//  domoTest
//
//  Created by 김영빈 on 2023/03/27.
//

/* 유저 닉네임 입력 화면 */
import NavigationStack
import SwiftUI

struct InformationView: View {
    @EnvironmentObject var user: UserSettings // 닉네임 입력
    @State var nicknameDone: Bool = false // 닉네임 입력 여부
    @State private var isInputAnimating = false // 입력창 깜빡거리는 효과를 위한 state변수
    @State private var isButtonAnimating = false // 버튼 깜빡거리는 효과를 위한 state변수

    var body: some View {
        ZStack(alignment: .topLeading) {
            // 배경색
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading) {
                MyText(text: "안녕하세요, 러너님. \n닉네임이 무엇인가요?", fontSize: 40)
                    .lineSpacing(16)
                    .padding(.top, 120)
                    .padding(.leading, 100)
                    .padding(.bottom, 50)

                // 입력폼
                HStack {
                    MyText(text: ">>>", fontSize: 40, textColor: .gray)
                        .padding(.leading, 100)
                        .opacity(isInputAnimating ? 0.3 : 1.0)
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { _ in
                                if nicknameDone == false {
                                    isInputAnimating.toggle()
                                }
                            }
                        }

                    SeperatedTextField(length: 8, string: $user.nickname)
                        .padding(.leading, 16)

                    // 확인 버튼
                    Button {
                        if user.nickname != "" {
                            nicknameDone = true
                            isButtonAnimating = true
                            isInputAnimating = false
                        }
                    } label: {
                        Text("확인")
                            .font(.custom(.DungGeunMo, size: 30))
                            .underline()
                            .padding(.leading, 40)
                            .foregroundColor(.gray)
                    }
                }
                
                if nicknameDone == true {
                    VStack(alignment: .leading) {
                        /* 진행 버튼 */
                        PushView(destination: StartView()) {
                            MyUnderlineText(
                                text: "네, 제가 \(user.nickname) 맞습니다. (진행하기)",
                                fontSize: 40,
                                arrowColor: Color("TitleColor"),
                                textColor: .white,
                                isBtnAnimating: true
                            )
                        }

                        
                        /* 취소 버튼 */
                        Button {
                            nicknameDone = false
                            isButtonAnimating = false
                            user.nickname = "" // 입력창의 닉네임도 지워줘야함
                        } label: {
                            MyUnderlineText(
                                text: "아닙니다. 다시 입력하고 싶어요.",
                                fontSize: 40,
                                arrowColor: .gray,
                                textColor: .gray,
                                isBtnAnimating: false
                            )
                            .padding(.top, 10)
                        }
                    }
                    .padding(.top, 80)
                    .padding(.leading, 100)
                }
            }
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
            .environmentObject(UserSettings())
            .previewInterfaceOrientation(.landscapeLeft)

    }
}
