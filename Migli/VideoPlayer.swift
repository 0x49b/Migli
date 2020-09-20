//
//  VideoPlayer.swift
//  Migli
//
//  Created by Roger Kreienbuehl on 20.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import AVKit
import SwiftUI

struct VideoPlayer: View {
    
    let top = false
    let atop = Image("atop")
    let aright = Image("aright")
    
    @State var isSoundOn: Bool = true
    
    var body: some View {
        ZStack{
            
        PlayerView()
            .navigationBarTitle("Product Finder", displayMode: .inline)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color("MigrosOrange")/*@END_MENU_TOKEN@*/)
            
            
            Image(isSoundOn ? "atop" : "aright").resizable().frame(width:200, height:200).onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.isSoundOn = false
            }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    self.isSoundOn = true
                }
            
          
            }
            
       
            
          
        }
        
  
        
        
    }
}

struct PlayerView: UIViewRepresentable {
    func updateUIView (_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    func makeUIView (context: Context)->UIView {
        return PlayerUIView (frame: .zero)
    }
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer ()
    
    override init (frame: CGRect) {
        super.init (frame: frame)
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "migli_ar_mock", ofType: "mp4")!)
        let player = AVPlayer (url: url)
        player.play ()
        player.rate = 1.0
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)
        layer.addSublayer (playerLayer)
    }
    
    required init? (coder: NSCoder) {
        fatalError ("init (coder :) has not been implemented")
    }
    
    override func layoutSubviews () {
        super.layoutSubviews ()
        playerLayer.frame = bounds
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
