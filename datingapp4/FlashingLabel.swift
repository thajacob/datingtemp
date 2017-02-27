//
//  FlashingLabel.swift
//  ProtocallLogin
//
//  Created by jakub skrzypczynski on 05/12/2016.
//  Copyright © 2016 test project. All rights reserved.
//

import UIKit

class FlashingLabel: UILabel {
    
    func flash() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {self.alpha = 1.0
        }) {(animationComplete) in
            if animationComplete == true {
                UIView.animate(withDuration: 0.3, delay: 2.0, options: .curveEaseOut, animations:{ self.alpha = 0.0}, completion: nil)
            }
        
        
    }

    

    }
}
