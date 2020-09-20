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
    @Binding var showNavigationView: Bool
    @State private var inputString: String = ""
    @State var isLongPressing: Bool = false
    @State var searchResults: [String] = []
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
                                let searchText = self.inputString
                                self.inputString = ""
                                self.endEditing()
                                self.searchProduct(searchText: searchText)
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
                // Spacer()
                List{
                    ForEach(searchResults) { result in
                        HStack {
                            Text(result)
                            Spacer()
                            Button(action: {
                                self.showAssistantView = false
                                self.showNavigationView = true
                            }) {
                                Image(systemName: "flag.circle")
                            }.foregroundColor(/*@START_MENU_TOKEN@*/Color("MigrosOrange")/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
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
