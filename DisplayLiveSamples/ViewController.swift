//
//  ViewController.swift
//  DisplayLiveSamples
//
//  Created by Luis Reisewitz on 15.05.16.
//  Copyright © 2016 ZweiGraf. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    let sessionHandler = SessionHandler()

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        sessionHandler.openSession()
        
        setupCameraLayer()
        setupGameLayer()
    }

    func setupCameraLayer(){
        let layer = sessionHandler.layer
        layer.frame = self.view.bounds
        layer.setAffineTransform(CGAffineTransformMakeRotation(CGFloat(M_PI)))
        layer.setAffineTransform(CGAffineTransformScale(layer.affineTransform(), 1, -1))
        self.view.layer.addSublayer(layer)
        
    }
    
    func setupGameLayer() {
        let skView = SKView(frame: view.frame)
        skView.allowsTransparency = true
        self.view.addSubview(skView as UIView)
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        let scene = GameScene(size: self.view.frame.size)
        scene.scaleMode = .AspectFill
        scene.backgroundColor = UIColor.clearColor()
        skView.presentScene(scene)
    }
}

