//
//  ProfileNavigationController.swift
//  AuctionExport
//
//  Created by Denis Filipas on 10/18/15.
//  Copyright © 2015 Егор Сидоренко. All rights reserved.
//

import UIKit

class ProfileNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        performSegueWithIdentifier("ShowLoginForm", sender: self)
    }

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    }
}
