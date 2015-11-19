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
    var userFirstName = String()
    var userLastName = String()
    var posts = [Post]()
    var level = 0
    var profilePicture = UIImage()

    init() {
    }
}