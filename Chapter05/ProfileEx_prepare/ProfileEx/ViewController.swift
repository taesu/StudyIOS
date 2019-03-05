//
//  ViewController.swift
//  ProfileEx
//
//  Created by TAE SU LEE on 15/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var isOpenedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func edit(_ sender: UIButton) {
        guard let evc = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController else { return }
        present(evc, animated: true, completion: nil)
    }
}

