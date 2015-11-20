//
//  HomeHeaderTableViewCell.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 11/19/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit

class HomeHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var nameButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor(red: 24/255, green: 104/255, blue: 255/255, alpha: 0.2)
        
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 0.5).CGColor
        
        picture.layer.cornerRadius = 23
        picture.layer.borderWidth = 1
        picture.layer.masksToBounds = true
        picture.layer.borderColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1).CGColor
        
        time.textColor = UIColor(red: 22/255, green: 150/255, blue: 232/255, alpha: 1)
        
    }

}
