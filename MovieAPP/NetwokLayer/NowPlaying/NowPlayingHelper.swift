//
//  NowPlayingHelper.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//

import Foundation
enum NowPlayingHelper {
    case all
    
    private var mainPath: String {
        return "movie/now_playing"
    }
    
     var endPoint: URL? {
        switch self {
        case .all:
            return CoreAPIHelper.instance.makeURL(path: mainPath)
        }
    }
}
