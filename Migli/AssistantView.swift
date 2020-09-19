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
    @State private var inputString: String = ""
    @State var isLongPressing: Bool = false
    let assistantSynth = AVSpeechSynthesizer()

    var body: some View {
        NavigationView {
            VStack{
                
                HStack{
                    Image("migli")
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 3))
                        .shadow(radius: 5)
                        .padding()
                    
                    VStack{
                        HStack{
                            TextField("search", text: $inputString)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            Button(action: {
                                print("Button pressed")
                            }) {
                                Image(systemName: "magnifyingglass")
                            }
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color("MigrosOrange")/*@END_MENU_TOKEN@*/)
                        }
                        
                        HStack{
                            Spacer()
                            
                            if (isLongPressing) {
                                LoadingDots()
                            }
                            else {
                                LoadingDots().hidden()
                            }
                            
                            
                            
                            Spacer()
                            Button(action: {                       
                                if(self.isLongPressing){
                                    self.isLongPressing = false
                                    print("long press stop")
                                }
                            }) {
                                Image(systemName: "mic.fill")
                            }
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color("MigrosOrange")/*@END_MENU_TOKEN@*/)
                            .simultaneousGesture(
                                
                                LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                                    print("long press start")
                                    self.isLongPressing = true
                            })
                        }.padding(.vertical)
                    }
                }.padding()
                Spacer()
            }
            .navigationBarTitle(Text("Migli"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showAssistantView = false
                }) {
                    Text("Done").foregroundColor(Color("MigrosOrange")).bold()
                })
        }.onAppear(perform: greeting)
    }
    
    private func greeting() {
        let greet = "Hello, I'm Migli, your virtual Migro assistant. How can I help you?"
        self.speech(text: greet)
    }
    
    private func speech(text: String) {
        
        
        let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Daniel-compact")
            utterance.rate = 0.5
            utterance.pitchMultiplier = 1.5
            utterance.preUtteranceDelay = 0
            utterance.volume = 1
        
        
        assistantSynth.speak(utterance)
    }
}

struct AssistantView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
