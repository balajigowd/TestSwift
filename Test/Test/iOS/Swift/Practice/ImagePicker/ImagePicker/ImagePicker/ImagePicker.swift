//
//  ImagePicker.swift
//  SwiftLabraries
//
//  Created by Balaji Goud  on 1/27/17.
//  Copyright © 2017 RBT. All rights reserved.
//

import UIKit


class ImagePicker: NSObject,UINavigationControllerDelegate {
    
    internal static let sharedInstance = ImagePicker()
    var completionBlockOnSelection : (selectedImage: UIImage) -> () = {_ in }
    var fromVC = UIViewController()
    
    class func OpenActionSheetToPickImage(from: UIViewController, completionBlock: (selectedImage: UIImage) -> ()){
        
        ImagePicker.sharedInstance.completionBlockOnSelection = completionBlock
        ImagePicker.sharedInstance.fromVC = from
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        let libraryAction = UIAlertAction(title: "Library", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            ImagePicker.sharedInstance.libraryOptionSelected()
        })
        
        let cameraAction = UIAlertAction(title: "Camera", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            ImagePicker.sharedInstance.cameraOptionSelected()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        
        optionMenu.addAction(libraryAction)
        optionMenu.addAction(cameraAction)
        optionMenu.addAction(cancelAction)
        from.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    private func libraryOptionSelected() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = ImagePicker.sharedInstance
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        ImagePicker.sharedInstance.fromVC.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    private func cameraOptionSelected() {
        let isCameraAvailable = UIImagePickerController.isSourceTypeAvailable(.Camera)
        if isCameraAvailable {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .Camera
            ImagePicker.sharedInstance.fromVC.presentViewController(imagePicker, animated: true, completion: nil)
        }else {
            let alertUnAvailability = UIAlertController.init(title: "ProductName", message: "This device doesn't support Camera.", preferredStyle: .Alert)
            let okAction = UIAlertAction.init(title: "Ok", style: .Default, handler: nil)
            alertUnAvailability.addAction(okAction)
            ImagePicker.sharedInstance.fromVC.presentViewController(alertUnAvailability, animated: true, completion: nil)
        }
    }
    
    
    
}

extension ImagePicker : UIImagePickerControllerDelegate
{
    // MARK: - UIImagePickerControllerDelegate Methods
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ImagePicker.sharedInstance.completionBlockOnSelection(selectedImage: pickedImage)
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
