//
//  DataSingleton.swift
//  ProfileEx
//
//  Created by TAE SU LEE on 05/03/2019.
//  Copyright © 2019 TaeSu Lee. All rights reserved.
//

import Foundation

class DataSingletone {
    var name: String?
    var statusType: StatusType?
    var isOpened: Bool?
    
    static let shared = DataSingletone()
    
    private init() {
        
    }
}
