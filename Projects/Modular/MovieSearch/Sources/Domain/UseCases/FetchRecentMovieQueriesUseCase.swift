//
//  Movie-App
//  FetchRecentMovieQueriesUseCase
//
//  Created by: und3fined on 10/22/20 at 17:41
//  Copyright © 2020 app.und3fined.com. All rights reserved.
//

import Foundation

protocol FetchRecentMovieQueriesUseCase {
    func execute(requestValue: FetchRecentMovieQueriesUseCaseRequestValue,
                 completion: @escaping (Result<[MovieQuery], Error>) -> Void) -> Cancellable?
}

final class DefaultFetchRecentMovieQueriesUseCase: FetchRecentMovieQueriesUseCase {
    
    private let moviesQueriesRepository: MoviesQueriesRepository
    
    init(moviesQueriesRepository: MoviesQueriesRepository) {
        self.moviesQueriesRepository = moviesQueriesRepository
    }
    
    func execute(requestValue: FetchRecentMovieQueriesUseCaseRequestValue,
                 completion: @escaping (Result<[MovieQuery], Error>) -> Void) -> Cancellable? {
        
        moviesQueriesRepository.fetchRecentsQueries(maxCount: requestValue.maxCount, completion: completion)
        return nil
    }
}

struct FetchRecentMovieQueriesUseCaseRequestValue {
    let maxCount: Int
}
