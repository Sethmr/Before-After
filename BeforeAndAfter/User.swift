//
//  User.swift
//  Food Fight
//
//  Created by Tyler Estes on 8/6/15.
//  Copyright (c) 2015 Freed-Hardeman University. All rights reserved.
//

import Foundation
import UIKit

class CurrentUser {
    class var sharedInstance: CurrentUser {
        struct Singleton {
            static let instance: CurrentUser = CurrentUser()
        }
        
        return Singleton.instance
    }
    var user: User?
}


class User {
    var username = String()
    var joinDate = NSDate()
    var lastOnlineDate = NSDate()
    var userFirstName = String()
    var userLastName = String()
    var posts = [Post]()
    var comments = [Comment]()
    var profilePicture = UIImage()

    init(name: String, firstName: String, lastName: String, picture: UIImage) {
        username = name
        userFirstName = firstName
        userLastName = lastName
        profilePicture = picture
        lastOnlineDate = NSDate()
    }
    
    init(name: String, firstName: String, lastName: String, cmts: [Comment], psts: [Post], picture: UIImage) {
        username = name
        userFirstName = firstName
        userLastName = lastName
        posts = psts
        comments = cmts
        profilePicture = picture
        lastOnlineDate = NSDate()
    }
    
    init() {
        
    }
}