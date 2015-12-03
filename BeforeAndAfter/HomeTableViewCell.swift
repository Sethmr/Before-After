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
    
    var beforeImage = UIImage()
    var afterImage = UIImage()
    var likeCount : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeNumberLabel.text = "\(likeCount) Likes"
        likeNumberLabel.textColor = UIColor(red: 24/255, green: 104/255, blue: 255/255, alpha: 1)
        //likeView.backgroundColor = UIColor(red: 24/255, green: 104/255, blue: 255/255, alpha: 0.2)
        //likeView.layer.borderWidth = 1
        //likeView.layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1).CGColor
        backgroundColor = UIColor(red: 22/255, green: 150/255, blue: 232/255, alpha: 0.1)
        slider.value = slider.minimumValue
    }

    @IBAction func likeButtonPressed(sender: AnyObject) {
        likeCount++
        likeNumberLabel.text = "\(likeCount) Likes"
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = sender.value
        if currentValue <= 0.5{
            beforeImageButton.setImage(beforeImage, forState: UIControlState.Normal)
        }else{
            beforeImageButton.setImage(afterImage, forState: UIControlState.Normal)
        }
    }

}
