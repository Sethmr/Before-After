//
//  ProfileViewController.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 10/22/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var lastActive: UILabel!
    @IBOutlet weak var friendCount: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendCount.text = String(DummyData.sharedInstance.friends.count)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        lastActive.text = dateFormatter.stringFromDate(CurrentUser.sharedInstance.user!.lastOnlineDate)
        fullName.text = CurrentUser.sharedInstance.user!.userFirstName + " " + CurrentUser.sharedInstance.user!.userLastName
        profileImage.image = CurrentUser.sharedInstance.user!.profilePicture
        buttonCosmetics(editProfileButton)
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1).CGColor

        self.collectionView.reloadData()
    }

    func buttonCosmetics(button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1).CGColor
    }
    
    @IBAction func editProfileButtonWasPressed(sender: AnyObject) {
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return DummyData.sharedInstance.seth.posts.count * 2
    }
    
   func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("profileCell", forIndexPath: indexPath) as! CollectionViewCell

        if indexPath.row % 2 == 0 {
            cell.pofileCellImage.image = DummyData.sharedInstance.seth.posts[indexPath.row / 2].imageBefore
        } else {
            cell.pofileCellImage.image = DummyData.sharedInstance.seth.posts[(indexPath.row - 1) / 2].imageAfter
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width/2 - 1, height: collectionView.frame.size.width/2 - 1)
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
