//
//  HappinessViewController.swift
//  Happiness
//
//  Created by dkonayuki on 4/6/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    var happiness: Int = 75 { // 0 = very sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("Happiness = \(happiness)")
            updateUI()
        }
    }
    
    private let HappinessGestureScale: CGFloat = 4
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: #selector(FaceView.scale(_:))))
        }
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50)/50
    }

}
