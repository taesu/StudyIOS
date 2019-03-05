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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    private func setup() {
        let data = DataSingletone.shared
        nameLabel.text = data.name
        statusLabel.text = data.statusType?.rawValue
        if let isOpened = data.isOpened {
            isOpenedLabel.text = isOpened ? "공개" : "비공개"
        }
    }
}

