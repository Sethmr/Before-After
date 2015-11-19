//
//  Comment.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 11/19/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//

import UIKit

class Comment{

    var message = String()
    var submissionDate = NSDate()
    var user = User()
    
    init() {
        
    }
    
    init(msg: String, subDate: NSDate, thisUser: User) {
        message = msg
        submissionDate = subDate
        user = thisUser
    }
}
