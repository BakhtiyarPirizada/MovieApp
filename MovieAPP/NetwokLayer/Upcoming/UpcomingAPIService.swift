//
//  UpcomingAPIService.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//

import Foundation
private let apiService = CoreAPIManager.instance
final class UpcomingAPIService: UpcomingUseCase {
    func getUpcomingMovies(completion: @escaping (UpcomingDTO?, String?) -> Void) {
        apiService.request(
            type: UpcomingDTO.self,
            url: UpcomingHelper.upcoming.endPoint,
            method: .GET) { [weak self] result in
                guard let _ = self else {return}
                switch result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
                
            }

    }
    
    
}
