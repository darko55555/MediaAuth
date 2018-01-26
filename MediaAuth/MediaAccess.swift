//
//  MediaAccess.swift
//  MediaAuth
//
//  Created by Darko Dujmovic on 26/01/2018.
//  Copyright © 2018 Darko Dujmovic. All rights reserved.
//

import UIKit
import AVFoundation

class MediaAccess{
    
    static func checkIfMediaAuthorized()->UIAlertController?{
        
        let cameraAuthorizationStatus = checkAuthorizationForCameraAccess()
        
        if cameraAuthorizationStatus == .denied{
            if #available(iOS 10.0, *) {
                let alertMediaTypeNotAvailable = UIAlertController(title:"Media unavailable", message: "Would you like to open settings and enable camera access ?", preferredStyle: UIAlertControllerStyle.alert)
                let settingsAction = UIAlertAction(title: "Open settings", style: .default) { (_) -> Void in
                    guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.openURL(settingsUrl)
                    }
                }
                alertMediaTypeNotAvailable.addAction(settingsAction)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                alertMediaTypeNotAvailable.addAction(cancelAction)
                return alertMediaTypeNotAvailable
            } else {
                 let alertMediaTypeNotAvailable = UIAlertController(title:"Media unavailable", message: "Please enable camera access in privacy settings", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertMediaTypeNotAvailable.addAction(okAction)
                return alertMediaTypeNotAvailable
            }
        }else{
            
            return nil
        }
    }
    
    static func checkAuthorizationForCameraAccess()->AVAuthorizationStatus{
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        
        return cameraAuthorizationStatus
    }
    
    
    static func askCameraPermission(){
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { _ in
            print()
        })
    }
    // USE THIS IF YOU NEED A RETURN
//    static func askCameraPermission()->Bool{
//        AVCaptureDevice.requestAccess(for: .video) { (result) in
//            return result
//        }
//    }
}


