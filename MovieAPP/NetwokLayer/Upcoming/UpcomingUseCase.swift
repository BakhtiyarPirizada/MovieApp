//
//  UpcomingUseCase.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//

import Foundation
protocol UpcomingUseCase {
    func getUpcomingMovies(completion: @escaping(UpcomingDTO?, String?) -> Void)
}
