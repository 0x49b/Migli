//
//  AssistantView.swift
//  Migli
//
//  Created by Roger Kreienbuehl on 19.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI
import AVFoundation

struct AssistantView: View {
    @Binding var showAssistantView: Bool
    let assistantSynth = AVSpeechSynthesizer()

    var body: some View {
        NavigationView {
            Text("Migli assistant")
            .navigationBarTitle(Text("Migli assistant"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showAssistantView = false
                }) {
                    Text("Done").bold()
                })
        }.onAppear(perform: greeting)
    }
    
    private func greeting() {
        let greet = "Hello, I'm Migli, your personal Migros assistant. How can I help you?"
        self.speech(text: greet)
    }
    
    private func speech(text: String) {
        assistantSynth.speak(AVSpeechUtterance(string: text))
    }
}
