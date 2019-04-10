//
//  MainTableViewController.swift
//  TableViewEx
//
//  Created by TAE SU LEE on 21/03/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private var dataset = ["사과", "바나나", "포도", "파인애플", "딸기", "참외"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd(_:)))
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
}

// MARK: - UITableViewDataSource
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataset.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        let text = dataset[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
}

// MARK: - Helper
private extension MainTableViewController {
    @objc func handleAdd(_ sender: Any) {
        dataset.append("추가")
        //        tableView.reloadData()
        tableView.beginUpdates()
        let indexPath = IndexPath(row: dataset.count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .right)
        tableView.endUpdates()
    }
}
