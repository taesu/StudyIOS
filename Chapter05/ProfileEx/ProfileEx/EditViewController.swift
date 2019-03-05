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
    
    var name: String?
    var statusType: StatusType = .free
    var isOpened: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        nameTextField.text = name
        statusSeg.selectedSegmentIndex = statusType == .free ? 0 : 1
        isOpenedSwitch.isOn = isOpened
    }
    
    @IBAction private func complete(_ sender: UIButton) {
        if let vc = presentingViewController as? ViewController {
            vc.name = nameTextField.text ?? ""
            vc.statusType = statusSeg.selectedSegmentIndex == 0 ? .free : .busy
            vc.isOpened = isOpenedSwitch.isOn
        }
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
