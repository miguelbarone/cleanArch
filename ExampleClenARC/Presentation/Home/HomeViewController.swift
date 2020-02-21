//
//  HomeViewController.swift
//  ExampleCleanARC
//
//  Created by Miguel Barone - MBA on 13/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
     public class func create() -> HomeViewController {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
           return view
       }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func callEmailScreen(_ sender: Any) {
    }
    
}
