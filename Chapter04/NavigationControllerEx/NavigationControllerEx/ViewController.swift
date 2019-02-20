//
//  ViewController.swift
//  NavigationControllerEx
//
//  Created by TAE SU LEE on 11/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func nextPage(_ sender: UIBarButtonItem) {
        let scv = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        navigationController?.pushViewController(scv!, animated: true)
    }
}

