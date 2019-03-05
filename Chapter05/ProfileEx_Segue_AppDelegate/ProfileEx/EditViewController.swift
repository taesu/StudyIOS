//
//  EditViewController.swift
//  ProfileEx
//
//  Created by TAE SU LEE on 15/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var statusSeg: UISegmentedControl!
    @IBOutlet private weak var isOpenedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        nameTextField.text = appDelegate?.name
        if let statusType = appDelegate?.statusType {
            statusSeg.selectedSegmentIndex = statusType == .free ? 0 : 1
        }
        if let isOpened = appDelegate?.isOpened {
            isOpenedSwitch.isOn = isOpened
        }
    }
    
    @IBAction private func complete(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.name = nameTextField.text
        appDelegate?.statusType = statusSeg.selectedSegmentIndex == 0 ? .free : .busy
        appDelegate?.isOpened = isOpenedSwitch.isOn
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
