//
//  ProfileViewController.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 10/22/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var lastActive: UILabel!
    @IBOutlet weak var friendCount: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("1")
        friendCount.text = String(DummyData.sharedInstance.friends.count)
        print("2")
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        lastActive.text = dateFormatter.stringFromDate(CurrentUser.sharedInstance.user!.lastOnlineDate)
        print("3")
        fullName.text = CurrentUser.sharedInstance.user!.userFirstName + " " + CurrentUser.sharedInstance.user!.userLastName
        print("4")
        profileImage.image = CurrentUser.sharedInstance.user!.profilePicture
        buttonCosmetics(editProfileButton)
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1).CGColor
        // Do any additional setup after loading the view.
    }

    func buttonCosmetics(button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1).CGColor
    }
    
    @IBAction func editProfileButtonWasPressed(sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
