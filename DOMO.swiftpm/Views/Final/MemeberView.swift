//
//  MemberView.swift
//  
//
//  Created by Chaeeun Shin on 2023/03/30.
//

import SwiftUI
import NavigationStack

struct MemberView: View {
    let name1 = ["ASH", "DION", "FLYNN"]
    let name2 = ["GRACE", "OCEAN", "REI"]
    @EnvironmentObject var bgm: BGM
    @State var isTitleAnimating = false
    
    var body: some View {
        ZStack {
            // 배경
            Color.black
                .onAppear{
                    bgm.okEffect.volume = 0.5
                }
            VStack {
                Spacer()
                // 제목
                HStack {
                    PopView(destination: .root) {
                        MyText(text:"DOYEONSI ", fontSize: 50)
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        bgm.secondBGM.stop()
                    })
                    MyText(text: "by First", fontSize: 50)
                    Text("Dot")
                        .font(.custom(.DungGeunMo, size: 50))
                        .foregroundColor(.red)
                }
                .padding(.bottom, 40)
                .opacity(isTitleAnimating ? 0.1 : 1.0)
                .onAppear{
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                        isTitleAnimating.toggle()
                    }
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                        bgm.okEffect.play()
                    }
                }
                .onDisappear{
                    bgm.okEffect.stop()
                }
                
                // 1행
                HStack(spacing: 90) {
                    ForEach(name1, id: \.self) { name in
                        MemberSubView(name: name)
                    }
                }
                .padding(.bottom, 20)
                
                // 2행
                HStack(spacing: 90) {
                    ForEach(name2, id: \.self) { name in
                        MemberSubView(name: name)
                    }
                }
                .padding(.bottom, 70)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct MemberSubView: View {
    let name: String
    var body: some View {
        VStack(spacing: 5) {
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(width: 210)
            MyText(text: name, fontSize: 50)
        }
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(BGM())
    }
}
