//
//  Browsing.swift
//  Dating App
//
//  Created by jakub skrzypczynski on 28/11/2016.
//  Copyright © 2016 test project. All rights reserved.
//

import UIKit

class Browsing: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    
    var cardView:UIView!
    var panGestureRecognizer:UIPanGestureRecognizer!
    var originalPoint: CGPoint!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized(gestureRecognizer:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
        
    }
        override func viewWillLayoutSubviews() {
            cardImage.center = self.view.center
        }
        
        
        func panGestureRecognized(gestureRecognizer: UIPanGestureRecognizer) {
            let xDistance = gestureRecognizer.translation(in: self.view).x
            let yDistance = gestureRecognizer.translation(in: self.view).y
            
            switch gestureRecognizer.state {
            case .began:
                self.originalPoint = self.view.center
                break
                
            case .changed:
                
                updateCardViewWithDistances(xDistance: xDistance, yDistance)
                                
                break
                
            case .ended:
                resetViewPositionAndTransformations()
                newImageAppear ()
                break
                
            default:
                break
            }
        }

        
        
        func updateCardViewWithDistances(xDistance:CGFloat, _ yDistance:CGFloat) {
            let rotationStrength = min(xDistance / 320, 1)
            let fullCircle = (CGFloat)(2*M_PI)
            
            let rotationAngle:CGFloat = fullCircle * rotationStrength / 16
            let scaleStrength:CGFloat = (CGFloat) (1 - fabsf(Float(rotationStrength)) / 2)
            let scale = max(scaleStrength, 0.93)
            
            let newX = self.originalPoint.x + xDistance
            let newY = self.originalPoint.y + yDistance
            
            let transform = CGAffineTransform(rotationAngle: rotationAngle)
            let scaleTransform = transform.scaledBy(x: scale, y: scale)
            
            self.cardImage.center = CGPoint(x: newX, y: newY)
            self.cardImage.transform = scaleTransform
        }
        
        
        func resetViewPositionAndTransformations() {
            UIView.animate(withDuration: 0.2, animations: {
                self.cardImage.center = self.originalPoint;
                self.cardImage.transform = CGAffineTransform(rotationAngle: 0);
                self.cardImage.isHidden = true
            })
            
        }
    
    func newImageAppear () {
        let image = UIImage(named:"model4.jpg")
        self.cardImage.image = image
        self.cardImage.center = self.view.center
        self.viewWillLayoutSubviews()
        self.resetViewPositionAndTransformations()
        self.cardImage.isHidden = false
        }

        
        
        
//        let panRecogniser = UIPanGestureRecognizer(target: self, action: #selector(Browsing.moveObject(_:)))
//        panRecogniser.minimumNumberOfTouches = 1
//        cardImage.addGestureRecognizer(panRecogniser)
    


    
    
//     func moveUp(_ animated: Bool) {
//    
//        UIView.animate(withDuration: 1.5, delay: 1.0, animations: {
//            var basketTopFrame = self.cardImage.frame
//            basketTopFrame.origin.y -= basketTopFrame.size.height
//                   self.cardImage.frame = basketTopFrame
//            
//           
//        }, completion: { finished in
//            print("top animation initiated")
//        })
//    }
    
    
    
    func moveObject(_ sender: UIPanGestureRecognizer)
    {
        
        cardImage.center = sender.location(in: cardImage.superview)
        print(cardImage.center.y)
        print(cardImage.center.x)

       let y =  cardImage.center.y
       let x =  cardImage.center.x
        
        
       
        if  x > 250 {
        
        print("to the right")
       
        }else if x < 90{
            
            print("to the left")
        
        }else if y < 150 {
            
      //  moveUp(true)
            
            print("go up")
            
        }else if y > 400 {
            
            print("goes down")
        }
 
        
        
        
        
        
        
        
       }
}


