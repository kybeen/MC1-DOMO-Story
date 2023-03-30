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
    var body: some View {
        ZStack {
            // 배경
            Color.black
            
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
