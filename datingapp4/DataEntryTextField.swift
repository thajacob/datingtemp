//
//  DataEntryTextField.swift
//  ProtocallLogin
//
//  Created by jakub skrzypczynski on 05/12/2016.
//  Copyright © 2016 test project. All rights reserved.
//

import UIKit

class DataEntryTextField: UITextField {

    func jitter() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint.init(x: self.center.x - 5.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint.init(x: self.center.x + 5.0, y: self.center.y))
        layer.add(animation, forKey:"position")
        
    }
}
