//
//  ViewController.swift
//  CustomeViewStar
//
//  Created by Lambda_School_Loaner_218 on 12/12/19.
//  Copyright © 2019 Lambda_School_Loaner_218. All rights reserved.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func upadteRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
        self.title = "UserRaiting: \(ratingControl.value) star"
        } else {
        self.title = "UserRaiting: \(ratingControl.value) stars"
        }
    
}

 }
