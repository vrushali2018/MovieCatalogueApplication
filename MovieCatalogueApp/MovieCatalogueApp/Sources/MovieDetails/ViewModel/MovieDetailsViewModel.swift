//
//  MovieDetailsViewModel.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 13/04/23.
//

import Foundation

protocol MovieDetailsDelegate {
    func getMovieDetails(movieId: Int, completion: @escaping (Bool) -> ())
    func getCastAndCrewDetails(movieId: Int, completion: @escaping (Bool) -> ())
    func getReviewData(movieId: Int, completion: @escaping (Bool) -> ())
}

class MovieDetailsViewModel: MovieDetailsDelegate {
    
    
    
    
    // MARK: - Variable Declarations
    var movieService: MovieDetailsService?
    var movieDetailsArr: MovieDetailsModel?
    var cityStr = ""
    var castDataArr = [Cast]()
    var crewDataArr = [Crew]()
    var similarMoviesArr = [SimilarMoviesResult]()
    var reviewDataArr = [ReviewResult]()
    
    init(movieService: MovieDetailsService) {
        self.movieService = movieService
    }
    
    func getMovieDetailsData() -> MovieDetailsModel? {
        return movieDetailsArr
    }
    
    func getCities() -> String {
        return cityStr
    }
    
    
    func getMovieDetails(movieId: Int, completion: @escaping (Bool) -> ()) {
        movieService?.getMovieDetailsData(movieId: movieId) { response in
            switch response {
            case .success(value: let response):
                self.movieDetailsArr = response
                
                var cityName = ""
                let city = response.productionCompanies
                for i in 0...(city!.count - 1) {
                    
                    cityName = cityName + (city?[i].name ?? "") + ", "
                }
                self.cityStr = cityName
                completion(true)
                return
            default:
                completion(false)
                break
            }
        }
    }
    
    func getCastData() -> [Cast] {
        return self.castDataArr
    }
    
    func getCrewData() -> [Crew] {
        return self.crewDataArr
    }
    
    func getCastAndCrewDetails(movieId: Int, completion: @escaping (Bool) -> ()) {
        movieService?.getMovieCastAndCrewData(movieId: movieId, completionHandler: { response in
            switch response {
            case .success(value: let response):
                guard let castResult = response.cast, let crewResult = response.crew else { return }
                self.castDataArr = castResult
                self.crewDataArr = crewResult
                completion(true)
                return
            default:
                completion(false)
                break
            }
        })
    }
    
    func getReviewData() -> [ReviewResult] {
        return reviewDataArr
    }
    
    func getReviewData(movieId: Int, completion: @escaping (Bool) -> ()) {
        movieService?.getReviewData(movieId: movieId, completionHandler: { response in
            switch response {
            case .success(value: let response):
                 
                guard let reviewResult = response.results else { return }
                self.reviewDataArr = reviewResult
                completion(true)
                return
            default:
                completion(false)
                break
            }
        })
    }
    
    
    func getSimilarMoviesData() -> [SimilarMoviesResult] {
        return similarMoviesArr
    }
    
    func getSimilartMoviesData(movieId: Int, completion: @escaping (Bool) -> ()) {
        movieService?.getSimilarMoviesData(movieId: movieId, completionHandler: { response in
            
            switch response {
            case .success(value: let response):
                guard let similarMoviesResult = response.results else { return }
                self.similarMoviesArr = similarMoviesResult
                completion(true)
                return
            default:
                completion(false)
                break
            }
       
        })
    }
    
}
 
