import SwiftUI
import SpriteKit
import  AVFoundation

class Player: SKSpriteNode{
    
    init(){
        let size = CGSize(width: 120, height: 220)
        super.init(texture: SKTexture(imageNamed: "i0"),color: UIColor.clear, size: size)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func idle(){
        self.position = CGPoint(x: -280, y: -120)
        let s0 = SKTexture(imageNamed:  "i0")
        let s1 = SKTexture(imageNamed:  "i1")
        let s2 = SKTexture(imageNamed:  "i2")
        let s3 = SKTexture(imageNamed:  "i3")
        let s4 = SKTexture(imageNamed:  "i4")
        let s5 = SKTexture(imageNamed:  "i5")
        let s6 = SKTexture(imageNamed:  "i6")
        let s7 = SKTexture(imageNamed:  "i7")
        let s8 = SKTexture(imageNamed:  "i8")
        let s9 = SKTexture(imageNamed:  "i9")
        let s10 = SKTexture(imageNamed:  "i10")
        let s11 = SKTexture(imageNamed:  "i11")
        let runAction = SKAction.animate(with: [s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11], timePerFrame: 0.1)
        self.run(SKAction.repeatForever(runAction))
    }
    
    func toRun(){
        let s1 = SKTexture(imageNamed:  "r0")
        let s2 = SKTexture(imageNamed:  "r1")
        let s3 = SKTexture(imageNamed:  "r2")
        let s4 = SKTexture(imageNamed:  "r3")
        let s5 = SKTexture(imageNamed:  "r4")
        let s6 = SKTexture(imageNamed:  "r5")
        let s7 = SKTexture(imageNamed:  "r6")
        let s8 = SKTexture(imageNamed:  "r7")
        let runAction = SKAction.animate(with: [s1,s2,s3,s4,s5,s6,s7,s8,], timePerFrame: 0.1)
        self.run(SKAction.repeatForever(runAction))
    }
    
    func jump(){
        let j0 = SKTexture(imageNamed:  "jump")
        let j1 = SKTexture(imageNamed: "landing")
        let m1 = SKAction.moveBy(x: 0, y: 120, duration: 0.2)
        let m2 = SKAction.moveBy(x: 0, y: -120, duration: 0.2)
        let jump = SKAction.sequence([m1,m2])
        let runAction = SKAction.animate(with: [j0,j1], timePerFrame: 0.1)
        self.run(SKAction.repeat(runAction, count: 1))
        self.run(SKAction.repeat(jump, count: 1))
       
    }
    
    
    func death(){
        let d1 = SKTexture(imageNamed:  "d1")
        let d2 = SKTexture(imageNamed:  "d2")
        let d3 = SKTexture(imageNamed:  "d3")
        let d4 = SKTexture(imageNamed:  "d4")
        let d5 = SKTexture(imageNamed:  "d5")
        let d6 = SKTexture(imageNamed:  "d6")
        let m1 = SKAction.moveTo(y: -195.0, duration: 0.2)
        self.size = CGSize(width: 220, height: 120)
        let dead = SKAction.sequence([m1])
        let runAction = SKAction.animate(with: [d1,d2,d3,d4,d5,d6], timePerFrame: 0.1)
        self.run(SKAction.repeat(dead, count: 1))
        self.run(SKAction.repeat(runAction, count: 1))
        let runAction2 = SKAction.animate(with: [d6], timePerFrame: 0.1)
        self.run(SKAction.repeatForever(runAction2))
    }
    
}



class GameScene: SKScene, SKPhysicsContactDelegate{
    
    var runner = Player()
    var jumper = SKSpriteNode()
    var startButton = SKSpriteNode()
    var background1 = SKSpriteNode()
    var startingTime2: TimeInterval?
    var startingTime1: TimeInterval?
    var startingTime3: TimeInterval?
    var stopped = false
    var musicSound = AVAudioPlayer()
    var musicSound2 = AVAudioPlayer()
    var musicSound3 = AVAudioPlayer()
    var pauseButton = SKSpriteNode()
    var playButton = SKSpriteNode()
    var soundOn = SKSpriteNode()
    var soundOff = SKSpriteNode()
    var soundBool = false
    var viewCamera = SKCameraNode()
    var restartButton = SKSpriteNode()
//    var queueNode = [SKSpriteNode()]
    var sample: SKVideoNode?
    var lose = SKSpriteNode()
    var isPlayed = false
    var b1 = SKSpriteNode()
    var b2 = SKSpriteNode()
    var j1 = SKSpriteNode()
    var j2 = SKSpriteNode()
    var l1 = SKSpriteNode()
    var l2 = SKSpriteNode()
    
    override func didMove (to view: SKView){
        
        physicsWorld.contactDelegate = self
        jumper = childNode(withName: "jumper") as! SKSpriteNode
        startButton = childNode(withName: "startButton") as! SKSpriteNode
        playButton = childNode(withName: "play") as! SKSpriteNode
        pauseButton = childNode(withName: "pause") as! SKSpriteNode
        soundOn = childNode(withName: "sON") as! SKSpriteNode
        soundOff = childNode(withName: "sOFF") as! SKSpriteNode
        restartButton = childNode(withName: "restartButton") as! SKSpriteNode
        
         b1 = drawSprite(parent: self, x: Int(-1.52), y: Int(219.19), width: Int(1270.54), height: Int(895.619), anchorX: 0.5, anchorY: 0.5, zPosition: -1, imageName: "p5", name: "background0")
        
         b2 = drawSprite(parent: self, x: Int(-1.52)+Int(1270.54), y: Int(219.19), width: Int(1270.54), height: Int(895.619), anchorX: 0.5, anchorY: 0.5, zPosition: -1, imageName: "p5", name: "background1" )
        
        j1 = drawSprite(parent: self, x: 0, y: Int(-278.92), width: Int(750), height: Int(100.601), anchorX: 0.5, anchorY: 0.5, zPosition: -1, imageName: "jungle", name: "jungle0")
        
        j2 = drawSprite(parent: self, x: 0+Int(750), y: Int(-278.92), width: Int(750), height: Int(100.601), anchorX: 0.5, anchorY: 0.5, zPosition: -1, imageName: "jungle", name: "jungle1")
        
        l1 = drawSprite(parent: self, x: 0, y: Int(-520), width: Int(1014), height: Int(400), anchorX: 0.5, anchorY: 0.5, zPosition: -1, imageName: "land", name: "land0")
        
        l2 = drawSprite(parent: self, x: 0+Int(1014), y: Int(-520), width: Int(1014), height: Int(400), anchorX: 0.5, anchorY: 0.5, zPosition: -1, imageName: "land", name: "land1")
        
        
        viewCamera.position = CGPoint(x: 0, y: 0 )
        scene?.addChild(viewCamera)
        viewCamera.addChild(runner)
        scene?.camera = viewCamera
        jumper.move(toParent: viewCamera)
        playButton.move(toParent: viewCamera)
        pauseButton.move(toParent: viewCamera)
        soundOn.move(toParent: viewCamera)
        soundOff.move(toParent: viewCamera)
        
        restartButton.move(toParent: viewCamera)
        restartButton.run(SKAction.hide())
        runner.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "i0"), size: CGSize(width: 120, height: 220))
        runner.physicsBody?.mass = 0.01
        runner.physicsBody?.affectedByGravity = false
        runner.physicsBody?.categoryBitMask = 1
        runner.physicsBody?.collisionBitMask = 2
        runner.physicsBody?.contactTestBitMask = 2
        playButton.run(SKAction.hide())
        pauseButton.run(SKAction.hide())
        jumper.run(SKAction.hide())
        startButton.move(toParent: viewCamera)
        runner.idle()
        stopped = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        let node = self.atPoint(touchLocation)
        
        switch node.name {
            
        case "jumper":
            runner.jump()
            musicSound2 = playSound(namePath: "Jump2", type: "wav", volumePower: 1,soundPlay: musicSound2)
            if !soundBool {
                musicSound2.play()
            }
            
        case "startButton":
            let hide = SKAction.hide()
            let fadeOut = SKAction.fadeOut(withDuration: 0.5)
            let seq = SKAction.sequence([fadeOut, hide])
            startButton.run(seq)
            jumper.run(SKAction.unhide())
            pauseButton.run(SKAction.unhide())
            soundOn.run(SKAction.hide())
            soundOff.run(SKAction.hide())
            restartButton.run(SKAction.hide())
            runner.toRun()
            stopped = false
            musicSound = playSound(namePath: "music", type: "mp3", volumePower: 0.05, soundPlay: musicSound)
            musicSound.play()
            
        case "pause":
            stopped = true
            runner.idle()
            jumper.run(SKAction.hide())
            pauseButton.run(SKAction.hide())
            playButton.run(SKAction.unhide())
            soundOn.run(SKAction.unhide())
            soundOff.run(SKAction.unhide())
            
        case "play":
            stopped = false
            runner.toRun()
            jumper.run(SKAction.unhide())
            pauseButton.run(SKAction.unhide())
            playButton.run(SKAction.hide())
            soundOn.run(SKAction.hide())
            soundOff.run(SKAction.hide())
            
        case "sON":
            if soundBool {
                musicSound.play()
            }
            soundBool = false
            
        case "sOFF":
            musicSound.stop()
            musicSound2.stop()
            soundBool = true
            
        case "restartButton":
            restart()
        default:
            break
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == 1  && contact.bodyB.categoryBitMask == 2) || (contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 1){
            musicSound3 = playSound(namePath: "Tosse", type: "wav", volumePower: 1,soundPlay: musicSound3)
            if !stopped {
                gameOver()
            }
        }
    }
    func playVideo() -> SKVideoNode{
        var nameVideo: String
        var randomNumber: Int
        randomNumber = Int.random(in: 1...5)
        switch randomNumber {
        case 1:
            nameVideo = "video1"
        case 2:
            nameVideo = "video2"
        case 3:
            nameVideo = "video3"
        case 4:
            nameVideo = "video4"
        case 5:
            nameVideo = "video5"
        default:
            nameVideo = "video1"
        }
        let videoNode: SKVideoNode? = {
            guard let urlString = Bundle.main.path(forResource: nameVideo, ofType: ".mp4") else {
                return nil
            }
            let url = URL(fileURLWithPath: urlString)
            let item = AVPlayerItem(url: url)
            let player = AVPlayer(playerItem: item)
            return SKVideoNode(avPlayer: player)
        }()
        videoNode!.size = CGSize(width: 615, height: 500)
        videoNode!.position = CGPoint(x: 0, y: 0)
        videoNode!.zPosition = 750
        
        return videoNode!
    }
    func gameOver(){
        stopped = true
        musicSound3.play()
        lose.texture = (SKTexture(imageNamed: "gameOver"))
        lose.position = CGPoint(x:0,y:0)
        jumper.run(SKAction.hide())
        pauseButton.run(SKAction.hide())
        musicSound.stop()
        sample = playVideo()
        sample?.play()
        isPlayed = true
        viewCamera.addChild(sample!)
        viewCamera.addChild(lose)
        runner.death()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !stopped {
            let tempTime1 =  currentTime
            let tempTime2 = tempTime1
            if startingTime1 == nil {
                startingTime1 = tempTime1
            } else if tempTime1-startingTime1!>0.02 {
                startingTime1=tempTime1
                addObstacles(scene: self)
            }
            if startingTime2 == nil {
                startingTime2 = tempTime2
            } else if tempTime2-startingTime2!>0.01 {
                moveCamera(scene: self)
                startingTime2=tempTime2
            }
        }else if startingTime3 == nil{
            if isPlayed{
                startingTime3 = currentTime
            }
        }else if currentTime-startingTime3! > 5.0 {
            restartButton.run(SKAction.unhide())
        }
    }
    
    func restart(){
        sample?.pause()
        sample?.removeFromParent()
        b1.position.x = -1.52
        b2.position.x = -1.52+1270.54
        j1.position.x = 0
        j2.position.x = 750
        l1.position.x = 0
        l2.position.x = 1014
        viewCamera.run(SKAction.moveTo(x: 0, duration: 0.1))
        viewCamera.run(SKAction.moveTo(y: 0, duration: 0.1))
        jumper.run(SKAction.unhide())
        pauseButton.run(SKAction.unhide())
        restartButton.run(SKAction.hide())
        startButton.run(SKAction.unhide())
        startButton.alpha = 1
        runner.size = CGSize(width: 120, height: 220)
        runner.run(SKAction.moveTo(y: -120, duration: 0.1))
        lose.run(SKAction.hide())
        runner.idle()
       
    }
    
    func playSound(namePath: String, type: String ,volumePower: Float, soundPlay: AVAudioPlayer) -> AVAudioPlayer{
        var temp = soundPlay
        let sound = Bundle.main.path(forResource: namePath, ofType: type)
        do{
            temp = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            temp.volume = volumePower
        }
        catch{
            print("error")
        }
        return temp
    }
    
    func addObstacles(scene: SKScene){
        var obstacles = SKSpriteNode()
        var randomNumber: Int
        var namePng = ""
        randomNumber = Int.random(in: 1...250)
        if randomNumber == 50{
            let type = Int.random(in: 1...4)
            
            switch type {
            case 1:
                namePng = "cigarette"
            case 2:
                namePng = "cigarette2"
            case 3:
                namePng = "cigarette3"
            default:
                namePng = "cigarette"
            }
            obstacles = SKSpriteNode(imageNamed: namePng)
            obstacles.name = "obastacle"
            obstacles.anchorPoint = CGPoint.zero
            obstacles.position = CGPoint(x: Int(scene.camera!.position.x) + Int(425), y: Int(scene.camera!.position.y) + Int(-235))
            if namePng == "cigarette2"  {
                obstacles.size = CGSize(width: 90, height: 90)
                obstacles.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 80, height: 60))
            } else{
                obstacles.size = CGSize(width: 85.91, height: 74.503)
                obstacles.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 85.91, height: 74.503))
            }
            obstacles.physicsBody?.mass = 0.01
            obstacles.physicsBody?.affectedByGravity = false
            obstacles.physicsBody?.categoryBitMask = 2
            obstacles.physicsBody?.collisionBitMask = 1
            obstacles.physicsBody?.contactTestBitMask = 1
            scene.addChild(obstacles)
        }
    }
    
    func moveCamera(scene: SKScene) {
        if let camera =  scene.camera {
            let backgroundVelocity = CGPoint(x: Int(self.size.height)/65, y:0)
            let amountToMoveX = backgroundVelocity.x * CGFloat(0.5)
            let amountToMoveY = backgroundVelocity.y * CGFloat(0.5)
            camera.position.x += amountToMoveX
            camera.position.y += amountToMoveY
            scene.enumerateChildNodes(withName: "background*") {
                node, _ in let background = node as! SKSpriteNode
                if background.position.x + background.size.width < camera.position.x {
                    background.position.x += background.size.width * 2
                }
            }
            scene.enumerateChildNodes(withName: "jungle*") {
                node, _ in let jungle = node as! SKSpriteNode
                if jungle.position.x + jungle.size.width < camera.position.x {
                    jungle.position.x += jungle.size.width * 2
                }
            }
            scene.enumerateChildNodes(withName: "land*") {
                node, _ in let land = node as! SKSpriteNode
                if land.position.x + land.size.width < camera.position.x {
                    land.position.x += land.size.width * 2
                }
            }
        }
    }
    
    func drawSprite(parent: SKNode, x: Int, y: Int, width: Int, height: Int, anchorX: Double, anchorY: Double, zPosition: CGFloat, imageName: String, name: String)->SKSpriteNode{
        
        let sprite = SKSpriteNode(imageNamed: imageName)
        sprite.anchorPoint = CGPoint(x: anchorX, y: anchorY)
        sprite.position = CGPoint(x: x , y: y)
        sprite.size = CGSize(width: width, height: height)
        sprite.name =  name
        sprite.zPosition = zPosition
        parent.addChild(sprite)
        return sprite
    }
    
}
