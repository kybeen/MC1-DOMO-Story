//
//  InformationView.swift
//  domoTest
//
//  Created by 김영빈 on 2023/03/27.
//

import SwiftUI

struct InformationView: View {
    @State var nickname: String = "" // 닉네임 입력
    @State var nicknameDone: Bool = false // 닉네임 입력 여부
    @State private var isInputAnimating = false // 입력창 깜빡거리는 효과를 위한 state변수
    @State private var isButtonAnimating = false // 버튼 깜빡거리는 효과를 위한 state변수
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            /* 배경색 */
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("안녕하세요, 러너님. \n닉네임이 무엇인가요?")
                    .foregroundColor(.white)
                    .font(.custom(.DungGeunMo, size: 35))
                    .padding(.leading, 60)
                    .padding(.top, 60)
                
                /* 입력폼 */
                HStack {
                    Text(">>>")
                        .foregroundColor(.gray)
                        .font(.custom(.DungGeunMo, size: 35))
                        .padding(.leading, 60)
                        .padding(.trailing, 10)
                        .opacity(isInputAnimating ? 0.3 : 1.0)
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { timer in
                                if (nicknameDone==false) {
                                    isInputAnimating.toggle()
                                }
                            }
                        }
                    
                    SeperatedTextField(length: 8, string: $nickname)
                    
                    // 확인 버튼
                    Button {
                        if nickname != "" {
                            nicknameDone = true
                            isButtonAnimating = true
                            isInputAnimating = false
                        }
                    } label: {
                        Text("확인")
                            .font(.custom(.DungGeunMo, size: 30))
                            .overlay(
                                Rectangle()
                                    .frame(width: 60, height: 3)
                                    .offset(y: 20)
                            )
                            .padding(.leading, 25)
                            .foregroundColor(.gray)

                    }
                }
                
                if (nicknameDone == true) {
                    VStack(alignment: .leading) {
                        /* 진행 버튼 */
                        Button {
                            // 다음 화면으로
                        } label: {
                            HStack {
                                Text(">>>")
                                    .foregroundColor(Color("TitleColor"))
                                    .padding(.trailing, 10)
                                Text("네, 제가 \(nickname) 맞습니다. (진행하기)")
                                    .overlay(
                                        Rectangle()
                                            .frame(width: 450, height: 3) // width 텍스트 길이에 맞게 수정 필요
                                            .offset(y: 20)
                                    )
                                    .foregroundColor(.white)
                                    .opacity(isButtonAnimating ? 0.3 : 1.0)
                                    .onAppear {
                                        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { timer in
                                            isButtonAnimating.toggle()
                                        }
                                    }
                            }
                            .font(.custom(.DungGeunMo, size: 30))
                        }
                        
                        /* 취소 버튼 */
                        Button {
                            //nickname = "" // 닉네임 지워줘야함 State값 변경하는 방법 찾기
                            nicknameDone = false
                            isButtonAnimating = false
                        } label: {
                            HStack {
                                Text(">>>")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                                Text("아닙니다. 다시 입력하고 싶어요.")
                                    .overlay(
                                        Rectangle()
                                            .frame(width: 450, height: 3) // width 텍스트 길이에 맞게 수정 필요
                                            .offset(y: 20)
                                    )
                                    .foregroundColor(.white)
                            }
                            .font(.custom(.DungGeunMo, size: 30))
                            .padding(.top, 10)
                        }
                    }
                    .padding(.top, 30)
                    .padding(.leading, 60)
                }
                
            }
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
