//
//  AppDelegate.swift
//  BeforeAndAfter
//
//  Created by Seth Rininger on 9/30/15.
//  Copyright © 2015 Seth Rininger. All rights reserved.
//
//https://color.adobe.com/Copy-of-My-Color-Theme-color-theme-7216242/edit/?copy=true
//backgroundColor = UIColor(red: 24/255, green: 255/255, blue: 157/255, alpha: 1)
//backgroundColor = UIColor(red: 24/255, green: 104/255, blue: 255/255, alpha: 1)
//backgroundColor = UIColor(red: 37/255, green: 227/255, blue: 255/255, alpha: 1)
//backgroundColor = UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1)
//backgroundColor = UIColor(red: 22/255, green: 150/255, blue: 232/255, alpha: 1)

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().barTintColor = UIColor(red: 24/255, green: 104/255, blue: 255/255, alpha: 1)
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().barStyle = UIBarStyle.Black
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Menlo-Bold", size: 24)!, NSForegroundColorAttributeName: UIColor(red: 22/255, green: 232/255, blue: 202/255, alpha: 1.0) ]
        
        UITabBar.appearance().tintColor = UIColor(red: 24/255, green: 104/255, blue: 255/255, alpha: 1)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

