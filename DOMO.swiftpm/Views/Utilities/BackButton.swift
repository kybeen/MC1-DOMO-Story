//
//  BackButton.swift
//  DOMO
//
//  Created by 박상원 on 2023/03/30.
//

import NavigationStack
import SwiftUI

struct BackButton: View {
    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
        PopView {
            ScriptButtonText(text: "BACK")
                .padding(.trailing, screenWidth * 0.02)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
