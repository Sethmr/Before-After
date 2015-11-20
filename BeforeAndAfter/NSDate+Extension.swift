//
//  NSDate+Extension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 17/10/14.
//  http://github.com/vitkuzmenko
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import Foundation

let kMinute = 60
let kDay = kMinute * 24
let kWeek = kDay * 7
let kMonth = kDay * 31
let kYear = kDay * 365

extension NSDate {
    
    var timeAgo: String {
        return timeAgoSinceDate(NSDate(), numericDates: true)
    }
    
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return "\(components.year)y"
        } else if (components.year >= 1){
            if (numericDates){
                return "1y"
            } else {
                return "Last year"
            }
        } else if (components.month >= 2) {
            return "\(components.month)m"
        } else if (components.month >= 1){
            if (numericDates){
                return "1m"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear >= 2) {
            return "\(components.weekOfYear)w"
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return "1w"
            } else {
                return "Last week"
            }
        } else if (components.day >= 2) {
            return "\(components.day)d"
        } else if (components.day >= 1){
            if (numericDates){
                return "1d"
            } else {
                return "Yesterday"
            }
        } else if (components.hour >= 2) {
            return "\(components.hour)h"
        } else if (components.hour >= 1){
            if (numericDates){
                return "1h"
            } else {
                return "An hour ago"
            }
        } else if (components.minute >= 2) {
            return "\(components.minute)m"
        } else if (components.minute >= 1){
            if (numericDates){
                return "1m"
            } else {
                return "A minute ago"
            }
        } else if (components.second >= 3) {
            return "\(components.second)s"
        } else {
            return "Just now"
        }
        
    }
    
    var timeUntil: String {
        
        let now = NSDate()
        let deltaSeconds = Int(fabs(timeIntervalSinceDate(now)))
        let deltaMinutes = deltaSeconds / 60
        
        var value: Int!
        
        if deltaSeconds < 5 {
            // Just Now
            return "Now"
        } else if deltaSeconds < kMinute {
            // Seconds Ago
            return String(format:"%d seconds left", deltaSeconds)
        } else if deltaSeconds < 120 {
            // A Minute Ago
            return "A minute left"
        } else if deltaMinutes < kMinute {
            // Minutes Ago
            return String(format:"%d minutes left",  deltaMinutes)
        } else if deltaMinutes < 120 {
            // An Hour Ago
            return String(format:"An hour left")
        } else if deltaMinutes < kDay {
            // Hours Ago
            value = Int(floor(Float(deltaMinutes / kMinute)))
            return String(format:"%d hours left", value)
        } else if deltaMinutes < (kDay * 2) {
        // Yesterday
        return "Tomorrow"
        }
        
        // Days Ago
        value = Int(floor(Float(deltaMinutes / kDay)))
        return String(format: "%d days left", value)
    }
    
}

