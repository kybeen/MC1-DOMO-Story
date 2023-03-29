//
//  SwiftUIView.swift
//  
//
//  Created by 김영빈 on 2023/03/28.
//

/* 닉네임 입력 완료 후 시작 화면 뷰 */
import NavigationStack
import SwiftUI

struct StartView: View {
    @EnvironmentObject var user: UserSettings // 사용자 정보
    @State private var isButtonAnimating = false // 버튼 깜빡거리는 효과를 위한 state변수
    @State var isDomoAnimating = false // 도모쿤 이미지 애니메이션 효과를 주기 위한 state변수
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("\(user.nickname)님. \n이제부터 당신은 『도모쿤』 입니다.")
                    .foregroundColor(.white)
                    .font(.custom(.DungGeunMo, size: 35))
                    .padding(.leading, 60)
                    .padding(.top, 60)
                
                
                PushView(destination: Baldan1View()) {
                    MyUnderlineText(
                        text: "아니. 왜요? (시작하기)",
                        fontSize: 30,
                        arrowColor: Color("TitleColor"),
                        textColor: .white,
                        underlineLen: 350,
                        isBtnAnimating: true
                    )
                }
                .padding(.top, 30)
                .padding(.leading, 60)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image("DomoHowl")
                        .resizable()
                        .frame(width: 326, height: 361)
                        .offset(y: isDomoAnimating ? -70 : 0)
                        .animation(.easeIn(duration: 1).repeatForever(), value: isDomoAnimating)
                        .onAppear {
                            isDomoAnimating = true
                        }
                    
                }
                .padding(.trailing, 50).padding(.bottom, 70)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(UserSettings())
    }
}
