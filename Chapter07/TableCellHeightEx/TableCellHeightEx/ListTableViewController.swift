//
//  ListTableViewController.swift
//  TableCellHeightEx
//
//  Created by TAE SU LEE on 26/03/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    private var list = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.estimatedRowHeight = 50
//        self.tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource
extension ListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        let label = cell.viewWithTag(100) as? UILabel
        label?.text = list[indexPath.row]
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
//        cell.textLabel?.numberOfLines = 0
//
//        cell.textLabel?.text = list[indexPath.row]
//
//        return cell
//    }
}

// MARK: - UITableViewDelegate
extension ListTableViewController {
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let row = list[indexPath.row]
//        let height = CGFloat(60 + row.count / 30 * 20)
//        return height
//    }
//
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
}

// MARK: - IBAction
private extension ListTableViewController {
    @IBAction func add(_ sender: Any) {
        //1. 알림창 객체의 인스턴스를 생성한다.
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요.", preferredStyle: .alert)
        
        //2. 알림창에 입력폼을 추가한다.
        alert.addTextField { tf in
            tf.placeholder = "내용을 입력하세요"
        }
        
        //3. OK 버튼 객체를 생성한다.
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            //4. 알림창의 0번째 입력필드에 값이 있다면
            if let title = alert.textFields?[0].text {
                //5. 배열에 입력된 값을 추가하고 테이블을 갱신
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        //6. 취소버튼 객체를 생성한다.
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        //7. 알림창 객체에 버튼 객체를 등록한다.
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        //7. 알림창을 띄운다.
        self.present(alert, animated: true, completion: nil)
    }
}
