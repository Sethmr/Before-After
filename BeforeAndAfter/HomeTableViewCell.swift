//
//  HomeTableViewCell.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 10/22/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var beforeImage: UIImageView!
    @IBOutlet weak var likeNumberLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    var likeCount : Int = 0

    func likeButtonPress() {
        likeNumberLabel.text = "\(++likeCount) Likes"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        likeNumberLabel.layer.cornerRadius = 30 /*likeButton.layer.frame.height / 2*/
        likeNumberLabel.layer.borderWidth = 2
        likeNumberLabel.layer.borderColor = UIColor.blackColor().CGColor
        likeNumberLabel.text = "\(likeCount) Likes"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
