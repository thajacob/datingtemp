//
//  Profile set.swift
//  Dating App
//
//  Created by jakub skrzypczynski on 15/11/2016.
//  Copyright © 2016 test project. All rights reserved.
//

import UIKit

class Profile_set: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBAction func dismissView(_ segue: UIButton) {
      //  var imageIndex = image1.
        
     //   print(imageIndex)
        
        performSegue(withIdentifier: "toBrowsePage", sender: nil)
        
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toBrowsePage"{
            
            let controller = segue.destination as! Profile
           // controller.picture = imagesArray.
            
            print(imagesArray[0])
            controller.picture = imagesArray[0]
            print(imagesArray[0])
        }}

    
        @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var image1: UIImageView!

    
    var imagesArray:[String] = []
    var realImagesArray:[UIImage] = []
    var saveArray:[Int] = [0,1,2,3]
    
    var defaultValue: UserDefaults!
    var passedPhoto:UIImage!
    
    //getting saved files from the directory
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //sending image to the profile page
        
        
        
        
        
        
        
        
        defaultValue = UserDefaults.standard
        image1.clipsToBounds = true
        image1.layer.cornerRadius = 8.0
        button2.clipsToBounds = true
        button2.layer.cornerRadius = 8.0
        button3.clipsToBounds = true
        button3.layer.cornerRadius = 8.0
        button4.clipsToBounds = true
        button4.layer.cornerRadius = 8.0
        
        
        if let newArray =  self.defaultValue.object(forKey: "imagesArray")
        {
            self.imagesArray = newArray as! [String]
            print("VDL  \(self.imagesArray)")
            self.realImagesArray = []
            var filesExist = true
            
            for imageName in self.imagesArray
            {
                let filemanager = FileManager.default
                
                if filemanager.fileExists(atPath: imageName)
                {
                    print("\(imageName) Exists")
                    
                    if let image = UIImage(contentsOfFile: imageName)
                    {
                        self.realImagesArray.append(image)
                    }
                }
                else
                {
                    print("\(imageName) doesn't exist")
                    filesExist = false
                }
            }
            if (!filesExist)
            {
                setupImages()
            }
        }
        else
        {
            setupImages()
        }
        
            self.image1.image = self.realImagesArray[0]
            self.button2.setImage(self.realImagesArray[1], for: .normal)
            self.button3.setImage(self.realImagesArray[2], for: .normal)
            self.button4.setImage(self.realImagesArray[3], for: .normal)
    }
    

    
    @IBOutlet var longPressGesture: UILongPressGestureRecognizer!
    
    // button is pressed
    
    @IBAction func pressLong(_ sender: UILongPressGestureRecognizer)
    {
        
    
       let myPickerController = UIImagePickerController()
      myPickerController.delegate = self
     // myPickerController.sourceType = UIImagePickerControllerSourceType.camera
     // self.present(myPickerController, animated: true, completion: nil)
        let sourceAvaliable = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        if sourceAvaliable {
            myPickerController.sourceType = .camera
            myPickerController.mediaTypes = ["public.image"]
            myPickerController.allowsEditing = false
            myPickerController.cameraCaptureMode = .photo
            present(myPickerController, animated: true, completion: nil)
        } else {
            print("The media is not avilable")
        }
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool)
    { //save Image paths
        
        
        let filemanager = FileManager.default
        
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask  = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        
        
        if let dirPath = paths.first
        {
        
            for index in 0...3
            {
                if saveArray[index] != index
                {
                    print("saving image\(index)")
                    
                let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("image\(index).png")
                
                let imageData = //UIImagePNGRepresentation(self.realImagesArray[index])
                UIImageJPEGRepresentation(self.realImagesArray[index], 1)
                
                filemanager.createFile(atPath: imageURL.path, contents: imageData , attributes: nil)
                }
                else
                {
                    print("not saving image\(index)")
                }
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            image1.image = image
            realImagesArray[0] = image
            saveArray[0] = -1
            print(realImagesArray)
        
        self.dismiss(animated: true, completion: nil)
        
        }
        

    }
    
    @IBAction func button(_ sender: UIButton) {
        
        print(realImagesArray)
        swap(&realImagesArray[0], &realImagesArray[sender.tag])
        swap(&saveArray[0],&saveArray[sender.tag])
     
        let tempImage = realImagesArray[sender.tag]
        let size = CGSize.init(width: 104, height: 112)
        UIGraphicsBeginImageContext(size)
        
        tempImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        
        sender.setImage(tempImage, for: .normal)
        image1.image = realImagesArray[0]
        
        // print(saveArray)
       // print(realImagesArray)
        
            }
   
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupImages()
    {
        let newImagesArray = ["male1","male2","male3","male4"]
        self.realImagesArray = [#imageLiteral(resourceName: "male1"),#imageLiteral(resourceName: "male2"),#imageLiteral(resourceName: "male3"),#imageLiteral(resourceName: "male4")]
        
        let filemanager = FileManager.default
        
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask  = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        self.imagesArray = []
        
        if let dirPath = paths.first
        {
            for index in 0...3
            {
                let imageName = newImagesArray[index]
                let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("image\(index).png")
                self.imagesArray.append(imageURL.path)
                
             //   let imageData = UIImagePNGRepresentation(UIImage(named: imageName)!)
                let imageData = UIImageJPEGRepresentation(UIImage(named:imageName)!,1.0)
                
                filemanager.createFile(atPath: imageURL.path, contents: imageData , attributes: nil)
                
            }
        }
        self.defaultValue.set(self.imagesArray, forKey: "imagesArray")
    }

    

}

