//
//  PopularHelper.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//
import Foundation

enum PopularHelper {
    case popular
    
    private var mainPath: String {
        return "movie/popular"
    }
    
     var endPoint: URL? {
        switch self {
        case .popular:
            return CoreAPIHelper.instance.makeURL(path: mainPath)
        }
    }
  
}

