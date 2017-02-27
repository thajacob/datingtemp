//
//  ViewController.swift
//  sliding cards
//
//  Created by jakub skrzypczynski on 01/12/2016.
//  Copyright © 2016 test project. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBAction func yesButton(_ sender: Any) {
    
    newImageAppear()
    
    }
    
   
    
    @IBAction func noButton(_ sender: Any) {
        newImageAppear()
    }
    
    
    @IBOutlet weak var ocupationLabel: UILabel!
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var mainImage2: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
       
    @IBOutlet weak var labelAge: UILabel!
    
    //var cardView:UIView!
    var panGestureRecognizer:UIPanGestureRecognizer!
    var originalPoint: CGPoint!
    
    var manyImages = ["model2","model3","model4","model_06"]
    var imageIndex = 0
    var label1Dictionary = [["image":"model2","name":"Anna","age":"27","match":"20%","ocup":"doctor"],
                            ["image":"model3","name":"Eva","age":"19","match":"85%","ocup":"student"],
                            ["image":"model4","name":"Venessa","age":"24","match":"75%","ocup":"designer"],
                            ["image":"model_06","name":"Martha","age":"23","match":"60%","ocup":"nurse"]]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized(gestureRecognizer:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
        
       
        
        // mainImage2.image = UIImage(named: "model3")
      //  mainImage.image = UIImage(named: "model2")
       
        mainImage2.image = UIImage(named:"model3")
        mainImage.image = UIImage(named:"model2")
        
        
       // self.cardView = createCardView()
        //self.view.addSubview(cardView)
        
    }
    
    
    
    
    
    override func viewWillLayoutSubviews() {
        mainImage.center = self.view.center
        mainImage2.center = self.view.center
        mainImage.clipsToBounds = true
        mainImage2.clipsToBounds = true
        mainImage.layer.cornerRadius = 8.0
        mainImage2.layer.cornerRadius = 8.0
        mainImage.layer.borderWidth = 6.0
        mainImage2.layer.borderWidth = 6.0
        mainImage.layer.borderColor = UIColor.black.cgColor
        mainImage2.layer.borderColor = UIColor.black.cgColor
    }
    
//    func createCardView() -> UIView {
//        let width = self.view.frame.width * 0.8
//        let height = self.view.frame.height * 0.8
//        let rect = CGRect(x: 0, y: 0, width: width, height: height)
//        
//        let tempCardView = UIView(frame: rect)
//        tempCardView.backgroundColor = UIColor.blue
//        tempCardView.layer.cornerRadius = 8;
//        tempCardView.layer.shadowOffset = CGSize(width: 7, height: 7)
//        tempCardView.layer.shadowRadius = 5;
//        tempCardView.layer.shadowOpacity = 0.5;
//        return tempCardView
//    }
    
    func panGestureRecognized(gestureRecognizer: UIPanGestureRecognizer) {
        let xDistance = gestureRecognizer.translation(in: self.view).x
        let yDistance = gestureRecognizer.translation(in: self.view).y
        
        switch gestureRecognizer.state {
        case .began:
            self.originalPoint = self.view.center
            
            
            break
            
        case .changed:
            
        //    updateCardViewWithDistances(xDistance: xDistance, yDistance)
            
            updateCard2ViewWithDistances(xDistance: xDistance, yDistance)
            //moveObject(panGestureRecognizer)
            
            break
            
        case .ended:
            resetViewPositionAndTransformations()
            newImageAppear()
            break
            
            
            
        default:
            break
        }
    }
    func newImageAppear () {
      
        imageIndex = (imageIndex+1)%manyImages.count
        self.mainImage2.image = UIImage(named: manyImages[imageIndex])
        self.labelName.text = label1Dictionary[imageIndex]["name"] as String?
        self.labelAge.text = label1Dictionary[imageIndex]["age"] as String?
        self.matchLabel.text = label1Dictionary[imageIndex]["match"] as String?
        self.ocupationLabel.text = label1Dictionary[imageIndex]["ocup"] as String?
        
        self.mainImage2.center = self.view.center
        //self.viewWillLayoutSubviews()
        //self.resetViewPositionAndTransformations()
        //self.mainImage.isHidden = false
        swap(&mainImage2.image, &mainImage.image)
        //swap(&mainImage2, &mainImage)
        //self.mainImage.isHidden = false
        mainImage2.self.sendSubview(toBack: mainImage2)
        //self.mainImage2.isHidden = true
    
        
        

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
        
        self.mainImage.center = CGPoint(x: newX, y: newY)
        self.mainImage.transform = scaleTransform
        mainImage.center = self.view.center
    }
  
    func updateCard2ViewWithDistances(xDistance:CGFloat, _ yDistance:CGFloat) {
        let rotationStrength = min(xDistance / 320, 1)
        let fullCircle = (CGFloat)(2*M_PI)
        
        let rotationAngle:CGFloat = fullCircle * rotationStrength / 16
        let scaleStrength:CGFloat = (CGFloat) (1 - fabsf(Float(rotationStrength)) / 2)
        let scale = max(scaleStrength, 0.93)
        
        let newX = self.originalPoint.x + xDistance
        let newY = self.originalPoint.y + yDistance
        
        let transform = CGAffineTransform(rotationAngle: rotationAngle)
        let scaleTransform = transform.scaledBy(x: scale, y: scale)
        
        self.mainImage2.center = CGPoint(x: newX, y: newY)
        self.mainImage2.transform = scaleTransform
        
        if  newX > 250 //|| b > 250
        {
            
            print("to the right")
            
        }else if newX < 90 //|| b < 90 
        {
            
            print("to the left")
            
        }else if newY < 150 // || a < 150 
        {
            
            //  moveUp(true)
            
            print("go up")
            
        }else if newY > 400 //|| a > 400 
        {
            
            print("goes down")
        }

        
        
    }
    
    
    
    
    func resetViewPositionAndTransformations() {
        UIView.animate(withDuration: 0.2, animations: {
            self.mainImage2.center.x -= self.view.bounds.width
            
//            self.mainImage2.center = self.originalPoint
          //  self.mainImage2.transform = CGAffineTransform(rotationAngle: 0.0)
//            self.mainImage.isHidden = false
        })
    
        }
    
    func moveObject(_ sender: UIPanGestureRecognizer)
    {
        
        mainImage.center = sender.location(in: mainImage.superview)
        mainImage2.center = sender.location(in: mainImage2.superview)
        print(mainImage.center.y)
        print(mainImage.center.x)
        
        let y =  mainImage.center.y
        let x =  mainImage.center.x
        let a = mainImage2.center.y
        let b = mainImage2.center.x
        
        
        
        if  x > 250 || b > 250 {
            
            print("to the right")
            
        }else if x < 90 || b < 90 {
            
            print("to the left")
            
        }else if y < 150 || a < 150 {
            
            //  moveUp(true)
            
            print("go up")
            
        }else if y > 400 || a > 400 {
            
            print("goes down")
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
}
    
    
    
    
    


   



