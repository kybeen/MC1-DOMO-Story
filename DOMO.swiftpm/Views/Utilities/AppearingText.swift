//
//  ContentView.swift
//  TypewriterTextEffect
//
//  Created by Глеб Михновец on 02.02.2022.
//

import SwiftUI

struct AppearingText: View, Animatable {
    @EnvironmentObject var bgm: BGM
    var fullText: String
    var numberOfLettersShow: Double
//    @State var max:
    var font: Font
    var animatableData: Double {
        get { numberOfLettersShow }
        set { numberOfLettersShow = newValue }
    }

    var numberOfLettersShowing: Int {
        Int(numberOfLettersShow) <= fullText.count ?
            Int(numberOfLettersShow) : fullText.count
    }

    var numberOfLettersDropped: Int { fullText.count - numberOfLettersShowing }

    var portionOfText: Substring { fullText.dropLast(numberOfLettersDropped) }

    var body: some View {
        Text(
            Int(numberOfLettersShow) > fullText.count ?
                portionOfText : portionOfText.dropLast() +  portionOfText.dropFirst(
                    Int(numberOfLettersShow) > fullText.count ?
                        numberOfLettersShowing :
                        numberOfLettersShowing - 1 < 0 ?
                        numberOfLettersShowing :
                        numberOfLettersShowing - 1
                )
        )
        .font(font)
        .onChange(of: numberOfLettersShow){ _ in
            bgm.happyEffect.play()
        }
    }
}
