//
//  Model+Movie.swift
//  MyMovieChart
//
//  Created by TAE SU LEE on 04/04/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import Foundation

extension Model {
    struct Hoppin: Codable {
        var hoppin: HoppineDetail?
//        var movie: [Movie]?
        
//        enum CodingKeys: String, CodingKey {
//            case hoppin
//        }
//
//        init(from decoder: Decoder) throws {
//            let value = try decoder.container(keyedBy: CodingKeys.self)
//            print("test 0")
//            let hoppin = try value.decode
//
//            if let totalCount = try? value.decode(String.self, forKey: .totalCount) {
//                self.totalCount = Int(totalCount)
//            }
//            print("test 1")
//            movies = try value.decode([String: Movie].self, forKey: .movies)
//            print("test 2")
//        }
    }
    
    struct HoppineDetail: Codable {
        var totalCount: Int?
        var movies: Movies?
        
        enum CodingKeys: String, CodingKey {
            case totalCount
            case movies
        }

        init(from decoder: Decoder) throws {
            let value = try decoder.container(keyedBy: CodingKeys.self)
            if let totalCount = try? value.decode(String.self, forKey: .totalCount) {
                self.totalCount = Int(totalCount)
            }
            movies = try value.decode(Movies.self, forKey: .movies)
        }
    }
    
    struct Movies: Codable {
        var movies: [Movie]?
        
        enum CodingKeys: String, CodingKey {
            case movies = "movie"
        }
    }
    
    struct Movie: Codable {
        var thumbnail: String? //영화 섬네일 이미지 주소
        var title: String? //영화 제목
        var description: String? //영화 설명
        var detail: String? //상세정보
        var opendate: String? //개봉일
        var rating: Double? //평점
        
        enum CodingKeys: String, CodingKey {
            case thumbnail = "thumbnailImage"
            case title
            case description = "genreNames"
            case detail = "linkUrl"
            case rating = "ratingAverage"
        }
        
        init(from decoder: Decoder) throws {
            let value = try decoder.container(keyedBy: CodingKeys.self)
            
            thumbnail = try value.decode(String.self, forKey: .thumbnail)
            title = try value.decode(String.self, forKey: .title)
            description = try value.decode(String.self, forKey: .description)
            detail = try value.decode(String.self, forKey: .detail)
            
            if let rating = try? value.decode(String.self, forKey: .rating) {
                self.rating = Double(rating)
            }
        }
        
    }
}
