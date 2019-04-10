//
//  MainViewController.swift
//  TableViewEx
//
//  Created by TAE SU LEE on 21/03/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private var dataset = ["사과", "바나나", "포도", "파인애플", "딸기", "참외"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd(_:)))
        navigationItem.rightBarButtonItem = rightBarButton
        
        tableView.dataSource = self
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        let text = dataset[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = dataset[indexPath.row]
        print(text)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Helper
private extension MainViewController {
    @objc func handleAdd(_ sender: Any) {
        dataset.append("추가")
//        tableView.reloadData()
        tableView.beginUpdates()
        let indexPath = IndexPath(row: dataset.count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .right)
        tableView.endUpdates()
    }
}
