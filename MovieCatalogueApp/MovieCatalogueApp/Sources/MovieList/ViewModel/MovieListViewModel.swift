//
//  MovieListViewModel.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 13/04/23.
//

import Foundation
import Alamofire 

protocol MovieListDelegate {
    func getMovieList(completion: @escaping (Bool) -> ())
}

class MovieListViewModel: MovieListDelegate {
    
    var movieListService: MovieListService?
    var movieListData = [Result]()
    
    init(movieListService: MovieListService?) {
        self.movieListService = movieListService
    }
    
    func getMovieData() -> [Result] {
        return movieListData
    }
    
    func getMovieList(completion: @escaping (Bool) -> ()) {
        movieListService?.getMovieListData(completionHandler: { response in
            switch response {
            case .success(value: let response):
                self.movieListData = response.results
               completion(true)  
                return
            default:
                completion(false)
                break
            }
        })
    }
}
