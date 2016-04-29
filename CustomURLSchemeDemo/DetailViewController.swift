//
//  DetailViewController.swift
//  CustomURLSchemeDemo
//
//  Created by steve on 2016-02-24.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBAction func dismiss(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
