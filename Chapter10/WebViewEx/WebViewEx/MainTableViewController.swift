//
//  MainTableViewController.swift
//  WebViewEx
//
//  Created by TAE SU LEE on 18/04/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit
import SafariServices

class MainTableViewController: UITableViewController {
    
    private let URLString = "http://m.saramin.co.kr"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "DetailUIWebViewController":
            let destination = segue.destination as? DetailUIWebViewController
            destination?.URLString = URLString
        case "DetailWKWebViewController":
            let destination = segue.destination as? DetailWKWebViewController
            destination?.URLString = URLString
        default:
            break
        }
    }
}

// MARK: - UITableViewDelegate
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let url = URL(string: URLString) else { return }
        
        switch indexPath.row {
        case 0: //Safari
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        case 3: //SFSafariViewController
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        default:
            break
        }
    }
}
