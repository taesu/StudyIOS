//
//  Router.swift
//  MyMovieChart
//
//  Created by TAE SU LEE on 02/04/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import Foundation
import Alamofire

enum Router {
    case movies(page: Int)
}

extension Router {
    var `protocol`: String {
        return "http"
    }
    
    var subdomain: String {
        return "swiftapi"
    }
    
    var domain: String {
        return ".rubypaper.co.kr:2029"
    }
    
    var host: String {
        return "\(subdomain)\(domain)"
    }
    
    var baseURL: URL {
        return URL(string: "\(self.protocol)://\(host)")!
    }
    
    var path: String {
        switch self {
        case .movies:
            return "/hoppin/movies"
        }
    }
    
    var url: URL {
        return baseURL.appendingPathComponent(path)
    }
    
    var method: HTTPMethod {
        switch self {
        case .movies:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .movies(let page):
            let params: [String: Any] = [
                "version": 1,
                "page": page,
                "count": 1000,
                "genreId": "",
                "order": "releasedateasc"
            ]
            return params
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    static let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        //        App.log(Alamofire.SessionManager.defaultHTTPHeaders)
//        if let userAgent = Alamofire.SessionManager.defaultHTTPHeaders["User-Agent"]  {
//            configuration.httpAdditionalHeaders = ["User-Agent": userAgent + App.appendUserAgent]
//        }
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
}

// MARK: - Request
extension Router {
    func buildRequest(_ completionHandler: @escaping (Data?) -> ()) {
        Router.manager
            .request(url,
                     method: method,
                     parameters: parameters,
                     encoding: parameterEncoding,
                     headers: headers)
            .responseData(completionHandler: { (data) in
                completionHandler(data.data)
            })
    }
}
