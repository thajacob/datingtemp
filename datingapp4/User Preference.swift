//
//  User Preference.swift
//  Dating App
//
//  Created by jakub skrzypczynski on 14/11/2016.
//  Copyright © 2016 test project. All rights reserved.
//

import UIKit

class User_Preference: UIViewController,UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var timePickerBirth: UITextField!
    @IBOutlet weak var dateField: UITextField!
        @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Surname: UITextField!
    @IBOutlet weak var Nickname: UITextField!
       
    
    @IBOutlet weak var newDOB: UITextField!
    
    @IBOutlet weak var newHour: UITextField!
    
    
    var defaultValue: UserDefaults!
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        createDatePicker ()
        createTimePicker()
        
    defaultValue = UserDefaults.standard
        
//     Surname.text = defaultValue.object(forKey: "surname") as! String?
        if let surname = defaultValue.object(forKey: "surname") as! String?
        {
            Surname.text = surname
        }
            else
        {
            Surname.text = ""
        }
        
       if let name = defaultValue.object(forKey: "name2") as! String?
       {
        Name.text = name
        
        }
       else{
        
        Name.text = ""
        
        }
        
        if let nickname = defaultValue.object(forKey: "nickname") as! String?
        {
            Nickname.text = nickname
        }
        else {
            
            Nickname.text = ""
        }
        
        
 //       if let dob = defaultValue.object(forKey: "dob") as! String?
//        {
 //           newDOB.text = dob
 //       }
  //      else {
  //          newDOB.text = ""
  //      }
        
        
        
       
       
    }
    
        func createDatePicker () {
            
            //format for picker
            
            datePicker.datePickerMode = .date
            
            
            //toolbar
            
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            
            //bar button item
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            
            toolbar.setItems([doneButton], animated: false)
            dateField.inputAccessoryView = toolbar
            
            //assiging date picker to text field
            
            dateField.inputView = datePicker
            
        }
        
        
        func donePressed() {
            
            //format date
            
            let dateFormater = DateFormatter()
            dateFormater.dateStyle = .short
            dateFormater.timeStyle = .none
            
            
            //display date 
            dateField.text = dateFormater.string(from: datePicker.date)
            self.view.endEditing(true)
            
            
        }

    
    func createTimePicker() {
        
        //format for picker
        
        timePicker.datePickerMode = .time
       
        
        
        //toolbar
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedTime))
        
        toolbar.setItems([doneButton], animated: false)
        timePickerBirth.inputAccessoryView = toolbar
        
        //assiging date picker to text field
        
        timePickerBirth.inputView = timePicker

        
        
    }
    
    func donePressedTime() {
        
        //format date
        
        let dateFormater = DateFormatter()
        dateFormater.timeStyle = .medium
        
        
        //display date
        timePickerBirth.text = dateFormater.string(from: timePicker.date)
        self.view.endEditing(true)
        
        
    }

    
    
    
    
    
    
    
    
    
      // defaultValue.set(10, forKey: "name")

    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return false to ignore.
        {
            textField.resignFirstResponder()
            return true
        }
        
    
        
    
    @IBAction func Name(_ sender: Any) {
        let current = Name.text
        
        defaultValue.set(current, forKey: "name2")
        print(defaultValue.object(forKey: "name2")!)
    }
    
    @IBAction func Surname(_ sender: Any) {
    
        defaultValue.object(forKey: "surname")
        
        let current = Surname.text
        defaultValue.set(current, forKey: "surname")
        print(defaultValue.object(forKey: "surname")!)
        
        
        
    }
    
    @IBAction func Nickname(_ sender: Any) {
    let current = Nickname.text
        defaultValue.set(current, forKey: "nickname")
        print(defaultValue.object(forKey: "nickname")!)
    }
    

    @IBAction func newDob(_ sender: Any) {
        let current = newDOB.text
        defaultValue.set(current, forKey:"dob")
        print(defaultValue.object(forKey: "dob")!)
    
    }
    
    @IBAction func hourOfBirth(_ sender: Any) {
        
        let current = newHour.text
        defaultValue.set(current, forKey:"dob")
        print(defaultValue.object(forKey: "dob")!)

        
        
    }
    
   //overide function to hide keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


