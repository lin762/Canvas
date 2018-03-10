//
//  ViewController.swift
//  Canvas
//
//  Created by Chris lin on 3/8/18.
//  Copyright © 2018 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayDownOffset = 160
        trayUp = trayView.center // The initial position of the tray
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset) // The position of the tray transposed down
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == .began{
            trayOriginalCenter = trayView.center
        }else if sender.state == .changed{
            trayView.center = CGPoint(x: trayOriginalCenter.x + translation.x, y: trayOriginalCenter.y + translation.y)
        }else if sender.state == .ended{
            if (velocity.y > 0){
                UIView.animate(withDuration:0.4, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.trayView.center = self.trayDown
                })
            }else if(velocity.y < 0){
                UIView.animate(withDuration:0.4, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.trayView.center = self.trayUp
                })
            }
            
        }
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

