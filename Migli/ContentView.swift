//
//  ContentView.swift
//  Migli
//
//  Created by Roger Kreienbuehl on 18.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return StartScreen()
    }
}

struct StartScreen : View {
    @State var showSheetView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack(alignment:.trailing) {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showSheetView.toggle()
                        }) {
                            Image("migli-smile")
                                .renderingMode(.original)
                        }.padding()
                    }
                }
            }
        }.sheet(isPresented: $showSheetView) {
            SheetView(showSheetView: self.$showSheetView)
        }
    }
}

struct SheetView: View {
    @Binding var showSheetView: Bool

    var body: some View {
        NavigationView {
            Text("Migli assistant")
            .navigationBarTitle(Text("Migli assistant"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showSheetView = false
                }) {
                    Text("Done").bold()
                })
        }
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
