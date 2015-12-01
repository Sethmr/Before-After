//
//  CameraViewController.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 10/22/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    // Must be declared here!
    var picker = UIImagePickerController()
    
    var beforeImage: UIImage? = nil
    var afterImage: UIImage? = nil
    
    @IBOutlet weak var libraryButton1: UIButton!
    @IBOutlet weak var libraryButton2: UIButton!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var takePhoto1Button: UIButton!
    @IBOutlet weak var takePhoto2Button: UIButton!
    var takePhotoButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextField.delegate = self
        picker.delegate = self
    }
    
    @IBAction func takePhoto1Tapped(sender: UIButton) {
        takePhotoButton = takePhoto1Button
        takePhotoTapped()
    }
    
    @IBAction func takePhoto2Tapped(sender: AnyObject) {
        takePhotoButton = takePhoto2Button
        takePhotoTapped()
    }
    
    func takePhotoTapped(){
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            // ! Creating the image picker here doesn't work!
            // picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            picker.showsCameraControls = true
            picker.modalPresentationStyle = .FullScreen
            
            presentViewController(picker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Camera Error", message: "No Camera", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(ok)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func libraryButton1Pressed(sender: AnyObject) {
        takePhotoButton = takePhoto1Button
        libraryButtonPressed()
    }
    
    @IBAction func libraryButton2Pressed(sender: AnyObject) {
        takePhotoButton = takePhoto2Button
        libraryButtonPressed()
    }
    
    func libraryButtonPressed() {
        picker.allowsEditing = false
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    // Image Controller Delegate methods
    
    // Image was chosen
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("Saving image to photos")
            UIImageWriteToSavedPhotosAlbum(chosenImage, self, nil, nil)
            print("setting image view")
            print(chosenImage)
            takePhotoButton.setImage(chosenImage, forState: UIControlState.Normal)
            if takePhotoButton == takePhoto1Button {
                beforeImage = chosenImage
            } else {
                afterImage = chosenImage
            }
        } else {
            print("chosen image has problem...")
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        //backgroundImageView.image = image
        takePhoto1Button.setImage(image, forState: UIControlState.Normal)
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
        })
        print("image selected from gallery")
        
        takePhoto1Button.setImage(image, forState: UIControlState.Normal)
        //self.backgroundImageView.image = image
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func x1Pressed(sender: AnyObject) {
        beforeImage = nil
        takePhoto1Button.setImage(UIImage(named: "camera"), forState: UIControlState.Normal)
        
    }
    @IBAction func x2Pressed(sender: AnyObject) {
        afterImage = nil
        takePhoto2Button.setImage(UIImage(named: "camera"), forState: UIControlState.Normal)
    }
    
    // Image picker canceled
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        buttonCosmetics(takePhoto1Button)
        buttonCosmetics(takePhoto2Button)
        buttonCosmetics(libraryButton1)
        buttonCosmetics(libraryButton2)
        buttonCosmetics(submitButton)
        submitButton.layer.backgroundColor = UIColor(red: 24/255, green: 104/255, blue: 255/255, alpha: 0.2).CGColor
    }
    
    func buttonCosmetics(button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1).CGColor
    }
    
    @IBAction func submitButtonPressed(sender: AnyObject) {

        if beforeImage != nil && afterImage != nil {
            DummyData.sharedInstance.posts += [Post(before: beforeImage!, after: afterImage!, likes: 0, descrip: descriptionTextField.text!, subDate: NSDate(), thisUser: CurrentUser.sharedInstance.user!)]
            let alertController = UIAlertController(title: "Post Submitted", message:
                "Your before and after pictures have been submitted to the feed.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {

            let alertController = UIAlertController(title: "Not Submitted", message:
                "You must select a before and after picture in order to submit them.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
