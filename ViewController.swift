//
//  ViewController.swift
//  HomeworkMiniGame
//
//  Created by Левиафан on 2024-06-20.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet var currentView: [MiniGameCustomView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
        
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else {
            return
        }
        
        
        gestureView.center = CGPoint(x: gestureView.center.x + gestureTranslation.x, y: gestureView.center.y + gestureTranslation.y)
        
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else {
            return
        }
        print("Что-то сейчас сработало!")
        
        for i in 0...currentView.count - 1 {
            for value in Int(currentView[i].frame.minX)...Int(currentView[i].frame.maxX) {
                if Int(gestureView.frame.origin.x) == value {
                    for value in Int(currentView[i].frame.minY)...Int(currentView[i].frame.maxY) {
                        if Int(gestureView.frame.origin.y) == value {
                            for currentElement in currentView {
                                if gestureView.frame.origin.x == currentElement.customView.frame.origin.x &&
                                    gestureView.frame.origin.y == currentElement.customView.frame.origin.y {
                                    gestureView.isHidden = true
                                }
                                currentView[i].customView.frame = CGRect(x: currentView[i].customView.frame.origin.x, y: currentView[i].customView.frame.origin.y, width: currentView[i].customView.frame.width + 5, height: currentView[i].customView.frame.height + 5)
                                currentView[i].customView.layer.cornerRadius = currentView[i].customView.frame.width / 2
                                currentView[i].customView.backgroundColor = .green
                            }
                        }
                    }
                }
            }
        }
    }
    
}
