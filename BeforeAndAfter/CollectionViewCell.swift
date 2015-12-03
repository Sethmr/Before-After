//
//  CollectionViewCell.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 12/3/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var pofileCellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.superview!.frame.size.width, self.frame.size.height)
    }
}
