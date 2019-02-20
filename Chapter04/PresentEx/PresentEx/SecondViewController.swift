//
//  SecondViewController.swift
//  PresentEx
//
//  Created by TAE SU LEE on 11/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func close(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
