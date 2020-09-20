//
//  ContentView.swift
//  Migli
//
//  Created by Roger Kreienbuehl on 18.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI
import RealityKit
import SDWebImageSwiftUI


struct ContentView : View {
    var body: some View {
        return StartScreen()
    }
}

struct StartScreen : View {
    @State var showAssistantView = false
    @State var isAnimating = true
    
    var body: some View {
        NavigationView {
            ZStack {
                
    
                randomMigli()
            
                VStack(alignment:.trailing) {

                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showAssistantView.toggle()
                        }) {
                             Image("migli-smile")
                             .renderingMode(.original)
                        }
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 3))
                            .shadow(radius: 5)
                            .padding()
                        
                    }
                }
            }
        }.sheet(isPresented: $showAssistantView) {
            AssistantView(showAssistantView: self.$showAssistantView)
        }
    }
    
    private func randomMigli() -> WebImage{
        
        let miglis = ["migli_blink","migli_eyebrows_raise","migli_look_around","migli_surprised","migli_wiggle"]
        let randomMigliIndex = Int.random(in: 0..<5)
        
        return WebImage(url: Bundle.main.url(forResource: miglis[randomMigliIndex], withExtension: "gif"), isAnimating: $isAnimating)
            .customLoopCount(1)
            .playbackRate(2.0)
            .resizable()
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
