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
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        
        let detail = NSURL(string: "myapp://detail")
        let master = NSURL(string: "myapp://master")
        
        let urlWithoutQueryItems = NSURLComponents(URL: url, resolvingAgainstBaseURL: false)
        urlWithoutQueryItems?.queryItems = nil
        
        print(urlWithoutQueryItems?.URL)
        
        guard urlWithoutQueryItems?.URL == detail || urlWithoutQueryItems?.URL == master else {
            return false
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nav  = self.window?.rootViewController as! UINavigationController
        print(nav.viewControllers.count)
        var vc: UIViewController?
        
        if urlWithoutQueryItems?.URL == detail {
            print(url)
            let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: false)
            let queryItems = components?.queryItems
            if let queryItems = queryItems {
                for item in queryItems {
                    print("query name: \(item.name)")
                    print("query value: \(item.value)")
                }
            }
            vc = storyboard.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        }
        
        if urlWithoutQueryItems?.URL == master {
            if nav.viewControllers.count > 0 {
                nav.popToRootViewControllerAnimated(false)
                return true
            } else {
            vc = storyboard.instantiateViewControllerWithIdentifier("MasterViewController") as! ViewController
            }
        }
        nav.pushViewController(vc!, animated: false)
        return true
    }
}

