//
//  DummyData.swift
//  Food Fight
//
//  Created by Tyler Estes on 8/6/15.
//  Copyright (c) 2015 Freed-Hardeman University. All rights reserved.
//

import Foundation
import UIKit

class DummyData {
    
    class var sharedInstance: DummyData {
        struct Singleton {
            static let instance: DummyData = DummyData()
        }
        return Singleton.instance
    }
    
    var seth = User(name: "sethmr", firstName: "Seth", lastName: "Rininger", picture: UIImage(named: "me")!)
    var estes = User(name: "tylerestes", firstName: "Tyler", lastName: "Estes", picture: UIImage(named: "tyler")!)
    var harry = User(name: "harryp", firstName: "Harry", lastName: "Potter", picture: UIImage(named: "harry")!)
    var ron = User(name: "ronw", firstName: "Ron", lastName: "Weasley", picture: UIImage(named: "ron")!)
    var hermione = User(name: "hermioneg", firstName: "Hermione", lastName: "Granger", picture: UIImage(named: "hermione")!)
    var snape = User(name: "severuss", firstName: "Severus", lastName: "Snape", picture: UIImage(named: "snape")!)
    
    var users = [User]()
    var posts = [Post]()
    var friends = [User]()
    
    
    init() {
        let now = NSDate()
        
        let ants = Post(before: UIImage(named: "beforeAnts")!, after: UIImage(named: "afterAnts")!, likes: 0, descrip: "ant infestation", subDate: now.dateByAddingTimeInterval(-60*60*24*1), thisUser: ron) // 1 day ago
        let back = Post(before: UIImage(named: "beforeBack")!, after: UIImage(named: "afterBack")!, likes: 23, descrip: "dog got heavy", subDate: now.dateByAddingTimeInterval(-60*60*24*1 - 60*60*2), thisUser: seth) // 1 day and 2 hours ago
        let cat = Post(before: UIImage(named: "beforeCat")!, after: UIImage(named: "afterCat")!, likes: 5, descrip: "i knew my cat could lose weight!", subDate: now.dateByAddingTimeInterval(-60*60*24*2), thisUser: seth) // 2 days ago
        let dog = Post(before: UIImage(named: "beforeDog")!, after: UIImage(named: "afterDog")!, likes: 8, descrip: "Brought out the shears!", subDate: now.dateByAddingTimeInterval(-60*60*24*6 - 60*60*12), thisUser: seth) // 6 days and 12 hours ago
        let driveway = Post(before: UIImage(named: "beforeDriveway")!, after: UIImage(named: "afterDriveway")!, likes: 2, descrip: "remodeled", subDate: now.dateByAddingTimeInterval(-60*60*24*7), thisUser: seth) // 7 days ago
        let face = Post(before: UIImage(named: "beforeFace")!, after: UIImage(named: "afterFace")!, likes: 8, descrip: "play with my food all day", subDate: now.dateByAddingTimeInterval(-60*60*24*1 - 60*60*12), thisUser: harry) // 1 day and 12 hours ago
        let fries = Post(before: UIImage(named: "beforeFries")!, after: UIImage(named: "afterFries")!, likes: 7, descrip: "this can't be real", subDate: now, thisUser: seth) // now
        let girl = Post(before: UIImage(named: "beforeGirl")!, after: UIImage(named: "afterGirl")!, likes: 9, descrip: "lookin good... ????", subDate: now.dateByAddingTimeInterval(-60*60*1), thisUser: hermione) // 1 hour ago
        let gummy = Post(before: UIImage(named: "beforeGummy")!, after: UIImage(named: "afterGummy")!, likes: 13, descrip: "mix em all together", subDate: now.dateByAddingTimeInterval(-60*60*24*1 - 60*60*6), thisUser: seth) // 1 day and 6 hours ago
        let guy = Post(before: UIImage(named: "beforeGuy")!, after: UIImage(named: "afterGuy")!, likes: 234, descrip: "what happened to my face", subDate: now.dateByAddingTimeInterval(-60*60*24*6), thisUser: snape) // 6 days ago
        let lawn = Post(before: UIImage(named: "beforeLawn")!, after: UIImage(named: "afterLawn")!, likes: 54, descrip: "spring cleaning", subDate: now.dateByAddingTimeInterval(-60*60*24*6 - 60*60*12), thisUser: estes) // 6 days and 12 hours ago
        let stick = Post(before: UIImage(named: "beforeStick")!, after: UIImage(named: "afterStick")!, likes: 1, descrip: "stick figures can lose weight too!!!", subDate: now.dateByAddingTimeInterval(-60*60*24*1 - 60*60*4), thisUser: seth) // 1 day and 4 hours ago
        
        seth.posts += [back, cat, dog, driveway, fries, gummy, stick]
        estes.posts += [lawn]
        harry.posts += [face]
        ron.posts += [ants]
        hermione.posts += [girl]
        snape.posts += [guy]
        
        //
        users += [seth, estes, harry, ron, hermione, snape]
        friends += [estes, harry, ron, hermione, snape]
        posts += [ants, back, cat, dog, driveway, face, fries, girl, gummy, guy, lawn, stick]

    }
    
}