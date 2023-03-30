//
//  InformationView.swift
//  domoTest
//
//  Created by 김영빈 on 2023/03/27.
//

// 유저 닉네임 입력 화면
import NavigationStack
import SwiftUI

struct InformationView: View {
    @EnvironmentObject var user: UserSettings // 닉네임 입력
    @EnvironmentObject var bgm: BGM
    @State var nicknameDone: Bool = false // 닉네임 입력 여부
    @State private var isInputAnimating: Bool = false // 입력창 깜빡거리는 효과를 위한 state변수
    @State private var isButtonAnimating: Bool = false // 버튼 깜빡거리는 효과를 위한 state변수

    @State var timer: Timer?

    enum Field {
        case focused
        case notFocused
    }

    @FocusState var focusField: Field?

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
                HStack(alignment: .bottom) {
                    if let focus: Field = focusField { // 입력 필드에 focus가 가있을 때만 화살표 보임
                        if focus != .notFocused {
                            MyText(text: ">>>", fontSize: 40, textColor: .gray)
                                .opacity(isInputAnimating ? 0.3 : 1.0)
                                .onAppear {
                                    timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { _ in
                                        if nicknameDone == false {
                                            isInputAnimating.toggle()
                                        }
                                    }
                                }
                                .onDisappear {
                                    timer?.invalidate()
                                }
                        }
                    }

                    SeperatedTextField(length: 8, string: $user.nickname)
                        .padding(.leading, 16)
                        .focused($focusField, equals: .focused)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.characters) // 대문자 영어만 입력되도록

                    // 확인 버튼
                    Button {
                        if user.nickname != "" { // 닉네임 입력이 돼있는 경우
                            nicknameDone = true
                            isButtonAnimating = true
                            isInputAnimating = false
                            focusField = .notFocused
                            hideKeyboard()
                        } else { // 닉네임 입력이 안돼있는 경우
                            focusField = .notFocused
                            hideKeyboard()
                        }
                        bgm.okEffect.play()
                        print(user.nickname) // 디버깅용
                    } label: {
                        Text("확인")
                            .font(.custom(.DungGeunMo, size: 30))
                            .underline()
                            .padding(.leading, 40)
                            .padding(.bottom, 10)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 100)

                if nicknameDone == true {
                    VStack(alignment: .leading) {
                        // 진행 버튼
                        PushView(destination: StartView()) {
                            MyUnderlineText(
                                text: "네, 제가 \(user.nickname) 맞습니다. (진행하기)",
                                fontSize: 40,
                                arrowColor: Color("TitleColor"),
                                textColor: .white,
                                isBtnAnimating: true
                            )
                            .onDisappear {
                                bgm.decideEffect.play()
                            }
                        }

                        // 취소 버튼
                        Button {
                            print(user.nickname)
                            nicknameDone = false
                            isButtonAnimating = false
                            user.nickname = "" // 입력창의 닉네임도 지워줘야함
                            focusField = .focused
                            bgm.cancelEffect.play()
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

// 키보드를 내리는 메소드를 View에서 쉽게 사용하기 위해 extension으로 정의
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
            .environmentObject(UserSettings())
            .environmentObject(BGM())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
