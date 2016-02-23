//
//  AddPostVC.swift
//  MyHoodApp
//
//  Created by Ronald Hernandez on 2/14/16.
//  Copyright © 2016 Solstice. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var postImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    @IBAction func onAddImageButtonTapped(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onCancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func onMakePostButtonTapped(sender: AnyObject) {
        
        if let title = titleField.text, let desc = descriptionField.text, let img = postImage.image {
            
            let imagePath = DataService.instance.saveImageAndCreatePath(img)
            let post = Post(imagePath: imagePath, title: title, description: desc)
            
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
            
        }
    }
    
    //Protocol Delegates
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
     
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
        
    }
    
}
