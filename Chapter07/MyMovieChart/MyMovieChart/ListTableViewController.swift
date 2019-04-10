//
//  ListTableViewController.swift
//  MyMovieChart
//
//  Created by TAE SU LEE on 12/03/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    // 1. 좀더 단순화 할 수 없을까?
//    var movies = [MovieVO]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        var mvo = MovieVO()
//        mvo.title = "다크나이트"
//        mvo.description = "영웅물에 철학에 음악까지 더해져 예술이 되다."
//        mvo.opendate = "2008-09-04"
//        mvo.rating = 8.95
//        movies.append(mvo)
//
//        mvo = MovieVO()
//        mvo.title = "호우시절"
//        mvo.description = "때를 알고 내리는 좋은 비"
//        mvo.opendate = "2009-10-08"
//        mvo.rating = 7.31
//        movies.append(mvo)
//
//        mvo = MovieVO()
//        mvo.title = "말할 수 없는 비밀"
//        mvo.description = "여기서 너까지 다섯 걸음"
//        mvo.opendate = "2015-05-07"
//        mvo.rating = 9.19
//        movies.append(mvo)
//    }
    
    var dataset = [
        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "darknight.jpg"),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpg"),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpg")
    ]
    
    lazy var movies: [MovieVO] = {
        var datalist = [MovieVO]()
        for (title, desc, opendate, rating, thumbnail) in dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            datalist.append(mvo)
        }
        return datalist
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource
extension ListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! MovieTableViewCell
        cell.titleLabel.text = movie.title
        cell.descLabel.text = movie.description
        cell.opendateLabel.text = movie.opendate
        cell.ratingLabel.text = "\(movie.rating ?? 0)"
        if let thumbnail = movie.thumbnail {
            cell.thumbnailImageView.image = UIImage(named: thumbnail)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath)
    }
}
