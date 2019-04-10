//
//  AddViewController.swift
//  NotificationEx
//
//  Created by TAE SU LEE on 16/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
    }
    
    @IBAction private func save(_ sender: UIBarButtonItem) {
        if let text = textField.text {
            NotificationCenter.default.post(name: NSNotification.Name("Noti"), object: nil, userInfo: ["text" : text])
        }
        navigationController?.popViewController(animated: true)
    }
}
