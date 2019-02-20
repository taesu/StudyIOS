//
//  ThirdViewController.swift
//  NavigationControllerEx
//
//  Created by TAE SU LEE on 19/02/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "페이지 3"
    }
    

    @IBAction func backToFirst(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
}
