//
//  HomeViewModel.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 30.12.24.
//



import Foundation
final class HomeViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
    }
    
    enum TimeInterval: String {
        case day, week
    }
    
    private var trendingUse: TrendingUseCase
    private var popularUse:PopularUseCase
    private var upcomingUse:UpcomingUseCase
    private var nowPlayingUse:NowPlayingUseCase
    
    var type: TimeInterval = .day {
        didSet {
            getTrendingMovieList()
        }
    }
    private(set) var movieDto: MovieDTO?
    private(set) var nowPlayingDTo: NowPlayingDTO?
    private(set) var popularDTO: PopularDTO?
    private(set) var UpcomingDTO: UpcomingDTO?
    
    var requestCallBack: ((ViewState) -> Void)?
    init() {
        trendingUse = TrendingAPIService()
        popularUse = PopularAPIService()
        nowPlayingUse = NowPlayingAPIService()
        upcomingUse = UpcomingAPIService()
    }
    
    //MARK: Tranding
    
    func getTrandingCount() -> Int {
        movieDto?.results?.count ?? 0
    }
    
    func getTrandingMovie(index: Int) -> MovieResult? {
        movieDto?.results?[index]
    }
    private func getTrendingMovieList() {
        requestCallBack?(.loading)
        trendingUse.getTrendingMovie(
            timeInterval: type.rawValue) { [weak self] dto, error in
                guard let self = self else {return}
                requestCallBack?(.loaded)
                if let dto = dto {
                    movieDto = dto
                    getNowPlayingMovie()
                } else if let error = error {
                    requestCallBack?(.error(error))
              }
         }
    }
    
    //MARK: NowPlaying
    
    func getNowPlayingCount() ->Int {
        nowPlayingDTo?.results?.count ?? 0
    }
    func getNowPlayingMovie(index:Int)->NowPlayingResult? {
        nowPlayingDTo?.results?[index]
    }
    func getNowPlayingMovie() {
        requestCallBack?(.loading)
        nowPlayingUse.getNowPlayingMovie { [weak self] dto, error in
               guard let self = self else {return}
               requestCallBack?(.loaded)
               if let dto = dto {
                   nowPlayingDTo = dto
                   getPopularMovie()
               } else if let error = error {
                   requestCallBack?(.error(error))
            }
        }
    }
    
    //MARK: Popular
    
    func getPopularCount() ->Int {
        popularDTO?.results?.count ?? 0
    }
    func getPopularMovie(index:Int) -> PopularResult? {
        popularDTO?.results?[index]
    }
    func getPopularMovie() {
        requestCallBack?(.loading)
        popularUse.getPopularMovies { [weak self] dto, error in
               guard let self = self else {return}
               requestCallBack?(.loaded)
               if let dto = dto {
                   popularDTO = dto
                   getUpcomingMovie()
               } else if let error = error {
                   requestCallBack?(.error(error))
             }
        }
    }
    
    //MARK: UpComing
    
    func getUpcomingCount() -> Int {
        UpcomingDTO?.results?.count ?? 0
    }
    func getUpcomingMovie(index:Int) -> UpcomingResult? {
        UpcomingDTO?.results?[index]
    }
    func getUpcomingMovie() {
        requestCallBack?(.loading)
        upcomingUse.getUpcomingMovies { [weak self] dto, error in
               guard let self = self else {return}
               requestCallBack?(.loaded)
               if let dto = dto {
                   UpcomingDTO = dto
                   requestCallBack?(.success)
               } else if let error = error {
                   requestCallBack?(.error(error))
            }
        }
    }
}

