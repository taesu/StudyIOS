//
//  SecondViewController.swift
//  NavigationControllerEx
//
//  Created by TAE SU LEE on 11/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextPage(_ sender: UIBarButtonItem) {
        if let scv = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") {
            navigationController?.pushViewController(scv, animated: true)
        }
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
