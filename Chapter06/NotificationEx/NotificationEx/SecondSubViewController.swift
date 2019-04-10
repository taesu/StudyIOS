//
//  SecondSubViewController.swift
//  NotificationEx
//
//  Created by TAE SU LEE on 16/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class SecondSubViewController: UIViewController {

    @IBOutlet private weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addObserver()
    }
    
//    deinit {
//        removeObserver()
//    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleObserver(_:)), name: NSNotification.Name("Noti"), object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func handleObserver(_ sender: Notification) {
        if let text = sender.userInfo?["text"] as? String {
            textLabel.text = text
        }
    }
}
