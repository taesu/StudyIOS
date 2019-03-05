//
//  ViewController.swift
//  ProfileEx
//
//  Created by TAE SU LEE on 15/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

enum StatusType: String {
    case free = "한가함"
    case busy = "바쁨"
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var isOpenedLabel: UILabel!
    
    var name: String = "홍길동"
    var statusType: StatusType = .busy
    var isOpened: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    private func setup() {
        nameLabel.text = name
        statusLabel.text = statusType.rawValue
        isOpenedLabel.text = isOpened ? "공개" : "비공개"
    }
    
    @IBAction private func edit(_ sender: UIButton) {
        guard let evc = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController else { return }
//        evc.nameTextField.text = name
        evc.name = name
        evc.statusType = statusType
        evc.isOpened = isOpened
        present(evc, animated: true, completion: nil)
    }
}

