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
    
//    var dataset = [
//        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "darknight.jpg"),
//        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpg"),
//        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpg")
//    ]
    
//    lazy var movies: [MovieVO] = {
//        var datalist = [MovieVO]()
//        for (title, desc, opendate, rating, thumbnail) in dataset {
//            let mvo = MovieVO()
//            mvo.title = title
//            mvo.description = desc
//            mvo.opendate = opendate
//            mvo.rating = rating
//            mvo.thumbnail = thumbnail
//            datalist.append(mvo)
//        }
//        return datalist
//    }()
    
    @IBOutlet private weak var moreButton: UIButton!
    
    private var movies = [MovieVO]()
    private var page = 1
    private let pageCount = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl?.addTarget(self, action: #selector(refreshMovie(_:)), for: .valueChanged)
        
//        callMovieAPI()
        callMovieApiAsync()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: - Helper
private extension ListTableViewController {
    func callMovieApiAsync() {
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(page)&count=\(pageCount)&genreId=&order=releasedateasc"
        let apiURI: URL = URL(string: url)!
        URLSession.shared.dataTask(with: apiURI) { (data, response, error) in
            guard let data = data else { return }
            let parseredMovies = self.parser(data)
            if self.page == 1 {
                self.movies.removeAll()
            }
            self.movies.append(contentsOf: parseredMovies)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
    
    func callMovieAPI() {
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(page)&count=\(pageCount)&genreId=&order=releasedateasc"
        let apiURI: URL = URL(string: url)!
        
        let apidata = try! Data(contentsOf: apiURI)

        let log = String(data: apidata, encoding: .utf8) ?? ""
        print("API Result = \(log)")

        let parseredMovies = parser(apidata)
        movies.append(contentsOf: parseredMovies)
        if parseredMovies.count < pageCount {
            moreButton.isHidden = true
        }
    }
    
    func parser(_ apidata: Data) -> [MovieVO] {
        guard let apiDictionary = (try? JSONSerialization.jsonObject(with: apidata, options: [])) as? [String: Any]
            else {
                return []
        }
        
        guard let hoppinDictionary = apiDictionary["hoppin"] as? [String: Any],
            let moviesDictionary = hoppinDictionary["movies"] as? [String: Any],
            let movieArray = moviesDictionary["movie"] as? [[String: Any]]
            else {
                return []
        }
        
        var movies = [MovieVO]()
        for movie in movieArray {
            let mvo = MovieVO()
            mvo.title = movie["title"] as? String
            mvo.description = movie["genreNames"] as? String
            mvo.detail = movie["linkUrl"] as? String
            if let ratingString = movie["ratingAverage"] as? String {
                mvo.rating = Double(ratingString)
            }
            mvo.thumbnail = movie["thumbnailImage"] as? String
            movies.append(mvo)
        }
        return movies
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage? {
        let mvo = movies[index]
        
        // 메모이제이션 : 저장된 이미지가 있으면 그것을 반환하고, 없을 경우 내려받아 저장한 후 반환
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            guard let thumbnail = mvo.thumbnail,
                let url = URL(string: thumbnail),
                let imageData = try? Data(contentsOf: url)
                else {
                    return nil
            }
            mvo.thumbnailImage = UIImage(data: imageData)
            return mvo.thumbnailImage
        }
    }
    
    @objc func refreshMovie(_ sender: Any) {
        refreshControl?.endRefreshing()
        page = 1
        callMovieApiAsync()
//        callMovieAPI()
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
//        if let thumbnail = movie.thumbnail {
//            cell.thumbnailImageView.image = UIImage(named: thumbnail)
//        }
        
//        if let thumbnail = movie.thumbnail, let url = URL(string: thumbnail) {
//            do {
//                let imageData = try Data(contentsOf: url)
//                cell.thumbnailImageView.image = UIImage(data: imageData)
//            } catch {
//                print(error)
//            }
//        }
        cell.thumbnailImageView.image = nil
        DispatchQueue.global().async { [weak self] in
            let image = self?.getThumbnailImage(indexPath.row)
            DispatchQueue.main.async {
                cell.thumbnailImageView.image = image
            }
        }
        
        print("호출된 행번호 : \(indexPath.row), 제목 : \(movie.title ?? "")")
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


// MARK: - IBAction
private extension ListTableViewController {
    @IBAction func more(_ sender: UIButton) {
        page += 1
        callMovieApiAsync()
//        callMovieAPI()
//        tableView.reloadData()
    }
}
