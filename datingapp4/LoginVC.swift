//
//  ViewController.swift
//  ProtocallLogin
//
//  Created by jakub skrzypczynski on 05/12/2016.
//  Copyright © 2016 test project. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: DataEntryTextField!
    @IBOutlet weak var passwordField: DataEntryTextField!
    @IBOutlet weak var errorLabel: FlashingLabel!
    @IBOutlet weak var loginBtn: LoginButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    

    @IBAction func loginBtnWasPressed(_ sender: Any) {
        
        emailField.jitter()
        passwordField.jitter()
        loginBtn.jitter()
        errorLabel.flash()
        
    }
    

}

