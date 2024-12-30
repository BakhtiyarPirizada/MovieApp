//
//  TrendingUseCase.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 26.12.24.
//

import Foundation
protocol TrendingUseCase {
    func getTrendingMovie(timeInterval: String, completion: @escaping(MovieDTO?, String?) -> Void?)
}
