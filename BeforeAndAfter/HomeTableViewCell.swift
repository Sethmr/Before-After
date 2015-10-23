//
//  HomeTableViewCell.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 10/22/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var beforeImageButton: UIButton!
    @IBOutlet weak var likeNumberLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    
    
    
    var likeCount : Int = 0

    func likeButtonPress() {
        likeNumberLabel.text = "\(++likeCount) Likes"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commentButton.layer.cornerRadius = 18
        likeNumberLabel.text = "\(likeCount) Likes"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
