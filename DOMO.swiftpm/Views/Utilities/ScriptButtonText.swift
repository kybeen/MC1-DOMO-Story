//
//  ScriptButtonText.swift
//
//
//  Created by 박상원 on 2023/03/28.
//

import SwiftUI

struct ScriptButtonText: View {
    var text: String = ""
    var body: some View {
        Text(text)
            .font(.custom(.DungGeunMo, size: 30))
            .foregroundColor(.white)
            .underline()
            .opacity(0.8)
    }
}

struct ScriptButtonText_Previews: PreviewProvider {
    static var previews: some View {
        ScriptButtonText()
    }
}
