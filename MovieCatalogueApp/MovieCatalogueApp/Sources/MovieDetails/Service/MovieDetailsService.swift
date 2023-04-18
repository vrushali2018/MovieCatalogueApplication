//
//  MovieDetailsService.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 14/04/23.
//

import Foundation


class MovieDetailsService {
    
    private var networkManager: NetworkManagerDelegate?
    
    init(networkManager: NetworkManagerDelegate) {
        self.networkManager = networkManager
    }
    
    internal func getMovieDetailsData(movieId: Int, completionHandler: @escaping (ApiResponse<MovieDetailsModel>) -> ()) {
        networkManager?.performRequest(serviceType: .getMovieDetails(movieId), completionHandler: completionHandler)
    }
    
    internal func getMovieCastAndCrewData(movieId: Int, completionHandler: @escaping (ApiResponse<CastAndCrewModel>) -> ()) {
        networkManager?.performRequest(serviceType: .castAndCrewDetails(movieId), completionHandler: completionHandler)
    }
    
    internal func getReviewData(movieId: Int, completionHandler: @escaping (ApiResponse<ReviewModel>) -> ()) {
        networkManager?.performRequest(serviceType: .getReviewData(movieId), completionHandler: completionHandler)
    }
    internal func getSimilarMoviesData(movieId: Int, completionHandler: @escaping (ApiResponse<SimilarMoviesModel>) -> ()) {
        networkManager?.performRequest(serviceType: .getSimilarMoviesData(movieId), completionHandler: completionHandler)
    }
}
