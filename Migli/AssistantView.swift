//
//  AssistantView.swift
//  Migli
//
//  Created by Roger Kreienbuehl on 19.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI
import AVFoundation
import SDWebImageSwiftUI

struct AssistantView: View {
    @Binding var showAssistantView: Bool
    @State private var inputString: String = ""
    @State var isLongPressing: Bool = false
    @State var searchResults: [String] = []
     @State var isAnimating: Bool = false
     @State var lastScale: CGFloat = 1.0
     @State var scale: CGFloat = 1.0

     
     
     let assistantSynth = AVSpeechSynthesizer()
     let assetURL = Bundle.main.url(forResource: "migli_intro_speech", withExtension: "gif")

    var body: some View {
        NavigationView {
            VStack{
                
                WebImage(url: Bundle.main.url(forResource: "migli_blink", withExtension: "gif"))
                .customLoopCount(1)
                .playbackRate(2.0)
                .resizable()
                .scaledToFit()
                .background(Color.white)
                .clipShape(Circle())
                .overlay( Circle()
                .stroke(Color.white, lineWidth: 3))
                .shadow(radius: 5)
                .padding()
                
                HStack{
                    
                    VStack{
                        HStack{
                            TextField("search", text: $inputString)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            Button(action: {
                                let searchText = self.inputString
                                self.inputString = ""
                                self.endEditing()
                                self.searchProduct(searchText: searchText)
                            }) {
                                Image(systemName: "magnifyingglass").font(.system(size: 25))
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
                                Image(systemName: "mic.fill").font(.system(size:25))
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
                // Spacer()
                List(searchResults) { result in
                    Text(result)
                }
            }
            .navigationBarTitle(Text("Migli"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showAssistantView = false
                    self.assistantSynth.stopSpeaking(at: AVSpeechBoundary.immediate)
                }) {
                    Text("Done").foregroundColor(Color("MigrosOrange")).bold()
                })
        }.onAppear(perform: greeting).onDisappear(perform: disappear)
    }
    
    private func greeting() {
        let greet = "Hello, I'm Migli, your virtual Migro assistant. How can I help you?"
        self.speech(text: greet)
    }
    
    private func disappear(){
        self.assistantSynth.stopSpeaking(at: AVSpeechBoundary.immediate)
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
    
    private func searchProduct(searchText: String) {
        
        self.searchResults.removeAll()
        
        if let path = Bundle.main.path(forResource: "products", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [String:Any], let products = jsonResult["products"] as? [[String:Any]] {
                    products.forEach { product in
                        self.searchResults.append(product["name"] as! String)
                    }
                }
            } catch {
                // handle error
            }
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

extension String: Identifiable {
    public var id: String {
        return self
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
