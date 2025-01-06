//
//  NowPlayingUseCase.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//

import Foundation
protocol NowPlayingUseCase {
    func getNowPlayingMovie(completion: @escaping(NowPlayingDTO?, String?) -> Void?)
}
