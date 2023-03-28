//
//  SwiftUIView.swift
//  
//
//  Created by 박상원 on 2023/03/28.
//

import SwiftUI

struct NextButton: View {
    var body: some View {
        Button {
            print("hi")
        } label: {
            Text("-->")
                .font(.custom(.DungGeunMo, size: 40))
                .foregroundColor(.white)
                .opacity(0.6)
        }
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        NextButton()
    }
}
