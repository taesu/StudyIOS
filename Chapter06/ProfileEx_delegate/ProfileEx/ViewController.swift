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
    
    private var name: String = "홍길동"
    private var statusType: StatusType = .busy
    private var isOpened: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "EditViewController":
            guard let destination = segue.destination as? EditViewController else { return }
            destination.delegate = self
            destination.name = name
            destination.statusType = statusType
            destination.isOpened = isOpened
        default:
            break
        }
    }
}

// MARK: - Helper
private extension ViewController {
    private func setup() {
        nameLabel.text = name
        statusLabel.text = statusType.rawValue
        isOpenedLabel.text = isOpened ? "공개" : "비공개"
    }
}

// MARK: - EditViewDelegate
extension ViewController: EditViewDelegate {
    func didSaveProfile(name: String, statusType: StatusType, isOpened: Bool) {
        self.name = name
        self.statusType = statusType
        self.isOpened = isOpened
        setup()
    }
}

