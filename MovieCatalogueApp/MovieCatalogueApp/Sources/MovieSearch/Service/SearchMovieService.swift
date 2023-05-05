//
//  MovieSearchService.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 18/04/23.
//

import Foundation

class SearchMovieService {
    
    var networkManager: NetworkManagerDelegate?
    
    init(networkManager: NetworkManagerDelegate?) {
        self.networkManager = networkManager
    }
    
    internal func getSearchMovieData(searchText: String, completionHandler: @escaping (ApiResponse<SearchMovieModel>) -> ()) {
        networkManager?.performRequest(serviceType: .getMovieSearchResult(searchText), completionHandler: completionHandler)
    }
    
}

