//
//  SplashView.swift
//  Migli
//
//  Created by Florian Thiévent on 19.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI
import AVKit

struct SplashView: View {
    
    @State var isActive:Bool = false
    
    var body: some View {
        VStack(spacing: -20){
            if self.isActive {
                ContentView()
            } else {
                
                VStack(spacing: -50){
                    Image("migli_font").resizable()
                        .frame(width: 320, height: 94)
                    
                    SynthLoaderView()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
       SplashView()
    }
}
