//
//  API.swift
//  MyMovieChart
//
//  Created by TAE SU LEE on 02/04/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import Foundation

struct API {
    func movies(page: Int, completionHandler: @escaping ([Model.Movie]) -> ()) {
        Router.movies(page: page).buildRequest { data in
            guard let data = data, let hoppin = try? JSONDecoder().decode(Model.Hoppin.self, from: data) else { return }
            print(hoppin)
            completionHandler(hoppin.hoppin?.movies?.movies ?? [])
        }
    }
}
