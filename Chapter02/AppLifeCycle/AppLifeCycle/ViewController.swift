//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by TAE SU LEE on 08/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(String(describing: type(of: self)) + ": " + #function)
    }
    
    deinit {
        print(String(describing: type(of: self)) + ": " + #function)
    }

    override func loadView() {
        super.loadView()
        print(String(describing: type(of: self)) + ": " + #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(String(describing: type(of: self)) + ": " + #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(String(describing: type(of: self)) + ": " + #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(String(describing: type(of: self)) + ": " + #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(String(describing: type(of: self)) + ": " + #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(String(describing: type(of: self)) + ": " + #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(String(describing: type(of: self)) + ": " + #function)
    }
    
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue) {
        
    }
}

