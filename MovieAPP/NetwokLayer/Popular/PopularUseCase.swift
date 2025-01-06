//
//  PopularUseCase.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//
import Foundation
protocol PopularUseCase {
    func getPopularMovies(completion: @escaping(PopularDTO?, String?) -> Void)
}
