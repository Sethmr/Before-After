//
//  HomeTableViewController.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 10/22/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DummyData.sharedInstance.posts = DummyData.sharedInstance.posts.sort { $0.submissionDate.timeIntervalSinceDate($1.submissionDate) >= 0 }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        self.reloadInputViews()
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl!)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func refresh(sender: AnyObject){
        self.reloadInputViews()
        self.tableView.reloadData()
        self.refreshControl!.endRefreshing()
    }
    
    @IBAction func imageButtonWasPressed(sender: AnyObject) {
        performSegueWithIdentifier("toImageDetails", sender: sender)
    }
    
    @IBAction func likeButtonPressed(sender: AnyObject) {
        let index = NSIndexPath(forRow: sender.tag, inSection: 0)
        let cell = tableView.cellForRowAtIndexPath(index) as! HomeTableViewCell
        cell.likeButtonPress()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return DummyData.sharedInstance.posts.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCellWithIdentifier("homeHeaderCell") as! HomeHeaderTableViewCell
        headerView.picture.image = DummyData.sharedInstance.posts[section].user.profilePicture
        headerView.nameButton.setTitle(DummyData.sharedInstance.posts[section].user.username, forState: UIControlState.Normal)
        
        let time = DummyData.sharedInstance.posts[section].submissionDate
        headerView.time.text = NSDate().timeAgoSinceDate(time, numericDates: true)
        
        return headerView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionHeight: CGFloat = 50.0
        
        return sectionHeight
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homeCell", forIndexPath: indexPath) as! HomeTableViewCell
        cell.likeButton.tag = indexPath.section
        cell.likeNumberLabel.tag = indexPath.section
        cell.likeCount = DummyData.sharedInstance.posts[indexPath.section].likeCount
        cell.likeNumberLabel.text = "\(DummyData.sharedInstance.posts[indexPath.section].likeCount) Likes"
        cell.beforeImageButton.setImage(DummyData.sharedInstance.posts[indexPath.section].imageBefore, forState: UIControlState.Normal)
        cell.beforeImageButton.contentVerticalAlignment = UIControlContentVerticalAlignment.Fill
        cell.beforeImageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Fill

        return cell
    }

//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//            let cell = tableView.cellForRowAtIndexPath(indexPath) as! HomeTableViewCell
//        return cell.beforeImage.layer.frame.height + cell.cellView.layer.frame.height + 1
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let idvc = segue.destinationViewController as! ImageDetailsViewController{
//            
//        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
  //  }


}
