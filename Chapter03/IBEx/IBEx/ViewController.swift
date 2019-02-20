//
//  ViewController.swift
//  IBEx
//
//  Created by TAE SU LEE on 19/02/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func clickButton1(_ sender: Any) {
        firstLabel.text = "Button1 Clicked"
    }
    
    @IBAction func clickButton2(_ sender: Any) {
        secondLabel.text = "Button2 Clicked"
    }
    
    @IBAction func clickButton3(_ sender: Any) {
        thirdLabel.text = "Button3 Clicked"
    }
}

