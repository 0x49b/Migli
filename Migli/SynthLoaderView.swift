//
//  SynthLoaderView.swift
//  Migli
//
//  Created by Florian Thiévent on 19.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

struct SynthLoaderView: View {
    @State private var shouldAnimate = false
        
        var body: some View {
            
            HStack(alignment: .center, spacing: 5) {
                
                Capsule(style: .continuous)
                    .fill(ColorManager.migrosOrange)
                    .frame(width: 10, height: shouldAnimate ? CGFloat.random(in: 50..<60) :10).animation(Animation.easeInOut(duration:Double.random(in: 0.4..<1.0)).repeatForever(autoreverses: true))
                
                Capsule(style: .continuous)
                    .fill(ColorManager.migrosOrange)
                    .frame(width: 10, height: shouldAnimate ? CGFloat.random(in: 30..<40) :10).animation(Animation.easeInOut(duration:Double.random(in: 0.4..<1.0)).repeatForever(autoreverses: true))
                Capsule(style: .continuous)
                    .fill(ColorManager.migrosOrange)
                    .frame(width: 10, height: shouldAnimate ? CGFloat.random(in: 70..<80) :10).animation(Animation.easeInOut(duration:Double.random(in: 0.4..<1.0)).repeatForever(autoreverses: true))
                Capsule(style: .continuous)
                    .fill(ColorManager.migrosOrange)
                    .frame(width: 10, height: shouldAnimate ? CGFloat.random(in: 30..<40) :10).animation(Animation.easeInOut(duration:Double.random(in: 0.4..<1.0)).repeatForever(autoreverses: true))
                Capsule(style: .continuous)
                    .fill(ColorManager.migrosOrange)
                    .frame(width: 10, height: shouldAnimate ? CGFloat.random(in: 50..<60) :10).animation(Animation.easeInOut(duration:Double.random(in: 0.4..<1.0)).repeatForever(autoreverses: true))
            }
            .frame(height: shouldAnimate ? 200 : 100)
            .onAppear {
                self.shouldAnimate = true
            }
        }
}

struct SynthLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        SynthLoaderView()
    }
}
