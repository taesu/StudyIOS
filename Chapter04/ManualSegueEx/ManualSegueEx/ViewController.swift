//
//  ViewController.swift
//  ManualSegueEx
//
//  Created by TAE SU LEE on 10/01/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        print(identifier)
    }

    @IBAction func windPresent(_ sender: UIButton) {
        performSegue(withIdentifier: "ManualPresent", sender: nil)
    }
    
    @IBAction func windPush(_ sender: Any) {
        performSegue(withIdentifier: "ManualPush", sender: nil)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
}

