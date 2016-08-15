//
//  AppDelegate.swift
//  CustomURLSchemeDemo
//
//  Created by steve on 2016-02-24.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }
    
    /*
     * Handles opening custom URL
     * The custom URL is registered in the info.plist like this:
     * URL Types >> item 0 >> URL Schemes >> item 0 : String myapp
     * To test is paste the one of the url's below into the safari browser
     */
    
    // "myapp://detail"
    // "myapp://master"
    
    let scheme = "myapp"
    let detailHost = "detail"
    let masterHost = "master"
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        
        let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: false)
        
        // get reference to the nav controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nav  = self.window?.rootViewController as! UINavigationController
        
        var vc: UIViewController?
        
        // create the DetailViewController
        
        if components?.host == detailHost {
            print(url)
            let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: false)
            
            // log out any query items
            let queryItems = components?.queryItems
            if let queryItems = queryItems {
                for item in queryItems {
                    print("query name: \(item.name)")
                    print("query value: \(item.value)")
                }
            }
            vc = storyboard.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        }
        
        // create master view controller
        
        if components?.host == masterHost {
            if nav.viewControllers.count > 0 {
                nav.popToRootViewControllerAnimated(false)
                return true
            } else {
                vc = storyboard.instantiateViewControllerWithIdentifier("MasterViewController") as! MasterViewController
            }
        }
        nav.pushViewController(vc!, animated: false)
        return true
    }
}

