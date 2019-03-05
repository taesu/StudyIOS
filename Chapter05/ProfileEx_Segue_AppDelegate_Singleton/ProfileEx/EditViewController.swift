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
        let data = DataSingletone.shared
        nameTextField.text = data.name
        if let statusType = data.statusType {
            statusSeg.selectedSegmentIndex = statusType == .free ? 0 : 1
        }
        if let isOpened = data.isOpened {
            isOpenedSwitch.isOn = isOpened
        }
    }
    
    @IBAction private func complete(_ sender: UIButton) {
        let data = DataSingletone.shared
        data.name = nameTextField.text
        data.statusType = statusSeg.selectedSegmentIndex == 0 ? .free : .busy
        data.isOpened = isOpenedSwitch.isOn
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
