//
//  Profile.swift
//  datingapp4
//
//  Created by jakub skrzypczynski on 14/12/2016.
//  Copyright © 2016 test project. All rights reserved.
//

import UIKit

class Profile: UIViewController {

    @IBAction func settings(_ sender: Any) {
    }
    @IBAction func yourProfile(_ sender: Any) {
    }
    @IBAction func searchButton(_ sender: Any) {
    }
    @IBOutlet weak var profilePhoto: UIImageView!
    
    var newImage:UIImage!
    
    var picture:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profilePhoto.image = UIImage(named:"male1")
        
        
        
        self.profilePhoto.layer.cornerRadius = self.profilePhoto.frame.size.width/3
        
            self.profilePhoto.clipsToBounds = true
        
        self.profilePhoto.layer.borderWidth = 3.0
        self.profilePhoto.layer.borderColor = UIColor.white.cgColor
        
               
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let imageToGet = picture
        {
            print(picture)
            profilePhoto.image = UIImage(contentsOfFile: imageToGet)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwind(segue: UIStoryboardSegue)
    {
        
    }

    
}
