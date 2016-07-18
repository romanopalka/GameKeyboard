//
//  GameViewController.swift
//  GameKeyboard
//
//  Created by Roman on 7/16/16.
//  Copyright (c) 2016 Roman. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    @IBOutlet var inputMenuView: UIView!
    @IBOutlet var txtInput: UITextField!
    
    @IBOutlet var bottomLayout: NSLayoutConstraint!

    var gameScene : GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        gameScene = GameScene(size: view.frame.size)
        
        if gameScene != nil
        {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            gameScene.scaleMode = .ResizeFill
            gameScene.position = CGPointZero
            skView.presentScene(gameScene)
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        txtInput.layer.borderColor = UIColor.grayColor().CGColor
        txtInput.layer.borderWidth = 1
        txtInput.layer.cornerRadius = 5
        txtInput.becomeFirstResponder()
        
        
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    @IBAction func onSend(sender: AnyObject) {
        
        let str = txtInput.text
        if str?.lowercaseString == "square" {
            gameScene.hideSquare()
            txtInput.text = ""    
        }
        
    }
    
    func keyboardWillShow(notification: NSNotification)
    {
        let userInfo = notification.userInfo!
        let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        let keyboardHeight = keyboardFrame.size.height
        self.bottomLayout.constant = keyboardHeight
        
       
        
    }
    
   
}
