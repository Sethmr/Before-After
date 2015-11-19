//
//  Post.swift
//  Food Fight
//
//  Created by Seth Rininger on 11/10/15.
//  Copyright (c) 2015 Freed-Hardeman University. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var imageBefore = UIImage()
    var imageAfter = UIImage()
    var likeCount = 0
    var description = String()
    var submissionDate = NSDate()
    var user = User()
    
    init() {
        
    }
    
    init(before: UIImage, after: UIImage, likes: Int, descrip: String, subDate: NSDate, thisUser: User) {
        imageBefore = before
        imageAfter = after
        likeCount = likes
        description = descrip
        submissionDate = subDate
        user = thisUser
    }
}