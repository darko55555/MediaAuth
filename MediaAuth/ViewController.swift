//
//  ViewController.swift
//  MediaAuth
//
//  Created by Darko Dujmovic on 26/01/2018.
//  Copyright © 2018 Darko Dujmovic. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        MediaAccess.askCameraPermission()
    }

    @IBAction func addPhoto(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add photo", message: "Add photo using:", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
            if let alertMediaTypeNotAvailable =  MediaAccess.checkIfMediaAuthorized(){
            self.present(alertMediaTypeNotAvailable, animated: true, completion: nil)
            }else{
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
            }
        
            }else{
        
            }
        
            }))
            alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
            }
        
            }))
        
            self.present(alert, animated: true, completion: nil)
    }
    

}

extension ViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //set image 
    }
    
}

