//
//  HomeViewController.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 10/1/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var likeThumb: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLayerCircular(profilePicture.layer)
        makeLayerRounded(commentButton.layer)
        makeLayerRounded(likes.layer)
        makeLayerRounded(share.layer)
        makeLayerRounded(likeThumb.layer)
    
    }
    
    func makeLayerRounded(layer: CALayer) {
        layer.cornerRadius = 5
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func makeLayerCircular(layer: CALayer) {
        layer.cornerRadius = 23
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.blackColor().CGColor
    }
}
