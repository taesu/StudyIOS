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
        let ud = UserDefaults.standard
        nameTextField.text = ud.string(forKey: "name")
        if let statusTypeString = ud.string(forKey: "statusType") {
            let statusType = StatusType(rawValue: statusTypeString) ?? .free
            statusSeg.selectedSegmentIndex = statusType == .free ? 0 : 1
        }
        isOpenedSwitch.isOn = ud.bool(forKey: "isOpened")
    }
    
    @IBAction private func complete(_ sender: UIButton) {
        let ud = UserDefaults.standard
        ud.set(nameTextField.text, forKey: "name")
        let statusType: StatusType = statusSeg.selectedSegmentIndex == 0 ? .free : .busy
        ud.set(statusType.rawValue, forKey: "statusType")
        ud.set(isOpenedSwitch.isOn, forKey: "isOpened")
        ud.synchronize()
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
