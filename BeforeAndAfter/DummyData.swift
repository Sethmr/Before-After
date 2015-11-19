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
    
    var seth = User()
    var estes = User()
    var harry = User()
    var ron = User()
    var hermione = User()
    var snape = User()
    
    var users = [User]()
    var friends = [User]()
    
    
    init() {

    }
    
}