//
//  DetailUIWebViewController.swift
//  WebViewEx
//
//  Created by TAE SU LEE on 18/04/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class DetailUIWebViewController: UIViewController {
    
    @IBOutlet private weak var webView: UIWebView!
    
    var URLString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        load()
    }
    
    private func load() {
        guard let URLString = URLString, let url = URL(string: URLString) else { return }
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }
}
