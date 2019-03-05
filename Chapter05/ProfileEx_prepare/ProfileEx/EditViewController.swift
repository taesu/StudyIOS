//
//  EditViewController.swift
//  ProfileEx
//
//  Created by TAE SU LEE on 15/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var statusSeg: UISegmentedControl!
    @IBOutlet weak var isOpenedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func complete(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
