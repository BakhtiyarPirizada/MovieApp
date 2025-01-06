//
//  UpcomingHelper.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//

import Foundation

enum UpcomingHelper {
    case upcoming
    
    private var mainPath: String {
        return "movie/upcoming"
    }
    
     var endPoint: URL? {
        switch self {
        case .upcoming:
            return CoreAPIHelper.instance.makeURL(path: mainPath)
        }
    }
}
