//
//  EditViewController.swift
//  ProfileEx
//
//  Created by TAE SU LEE on 15/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

protocol EditViewDelegate: class {
    func didSaveProfile(name: String, statusType: StatusType, isOpened: Bool)
}

class EditViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var statusSeg: UISegmentedControl!
    @IBOutlet weak var isOpenedSwitch: UISwitch!
    
    weak var delegate: EditViewDelegate?
    
    var name: String?
    var statusType: StatusType = .free
    var isOpened: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    deinit {
        print(String(describing: type(of: self)) + ": " + #function)
    }
    
    private func setup() {
        nameTextField.text = name
        statusSeg.selectedSegmentIndex = statusType == .free ? 0 : 1
        isOpenedSwitch.isOn = isOpened
    }
    
    @IBAction private func complete(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true) { [weak self] in
            guard let `self` = self else { return }
            let name = self.nameTextField.text ?? ""
            let statusType: StatusType = self.statusSeg.selectedSegmentIndex == 0 ? .free : .busy
            let isOpened = self.isOpenedSwitch.isOn
            self.delegate?.didSaveProfile(name: name, statusType: statusType, isOpened: isOpened)
        }
    }
}
