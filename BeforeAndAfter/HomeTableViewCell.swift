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
    @IBOutlet weak var moreButton: UIButton!
    
    
    
    var likeCount : Int = 0

    func likeButtonPress() {
        likeNumberLabel.text = "\(++likeCount) Likes"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commentButton.layer.cornerRadius = 18
        commentButton.backgroundColor = UIColor(red: 22/255, green: 150/255, blue: 232/255, alpha: 0.5)
        commentButton.layer.borderWidth = 1
        commentButton.layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1).CGColor
        
        likeNumberLabel.text = "\(likeCount) Likes"
        likeNumberLabel.textColor = UIColor(red: 24/255, green: 104/255, blue: 255/255, alpha: 1)
        likeNumberLabel.backgroundColor = UIColor(red: 22/255, green: 150/255, blue: 232/255, alpha: 0.5)
        likeNumberLabel.layer.borderWidth = 1
        likeNumberLabel.layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1).CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
