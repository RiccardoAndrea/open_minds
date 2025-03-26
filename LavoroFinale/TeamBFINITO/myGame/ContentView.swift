//
//  ContentView.swift
//  myGame
//
//  Created by Marco on 20/10/21.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene{
        let scene = SKScene(fileNamed: "GameScene")
        scene!.size = CGSize(width: 750, height: 1334)
        scene?.scaleMode = .aspectFit
        return scene!
    }
    var body: some View{
        SpriteView(scene: scene).edgesIgnoringSafeArea(.all)
    }
}
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
