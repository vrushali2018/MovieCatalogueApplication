//
//  SearchMovieViewModel.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 18/04/23.
//

import Foundation

protocol SearchMovieDelegate {
    func getSearchMovieData(searchText: String, completion: @escaping (Bool) -> ())
}

class SearchMovieViewModel: SearchMovieDelegate {
  
    // MARK: - Variable Declarations
    var searchMovieService: SearchMovieService?
    
    init(searchMovieService: SearchMovieService?) {
        self.searchMovieService = searchMovieService
    }
    
    func getSearchMovieData(searchText: String, completion: @escaping (Bool) -> ()) {
        self.searchMovieService?.getSearchMovieData(searchText: searchText, completionHandler: { response in
            print(response)
        })
    }
    
    
    
}
