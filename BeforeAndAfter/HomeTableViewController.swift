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
        cell.beforeImage = DummyData.sharedInstance.posts[indexPath.section].imageBefore
        cell.afterImage = DummyData.sharedInstance.posts[indexPath.section].imageAfter
        cell.beforeImageButton.contentVerticalAlignment = UIControlContentVerticalAlignment.Fill
        cell.beforeImageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Fill

        return cell
    }
}
