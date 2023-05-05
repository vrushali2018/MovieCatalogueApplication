//
//  NetworkService.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 13/04/23.
//

import Foundation

enum ApiResponse<T> {
    case success(value: T)
    case failure(error: Error)
}

enum NetworkAPI { 
    
    enum NetworkEnvironment {
        case Development
        case Production
        case Quality
    }
    
    var networkEnvironment: NetworkEnvironment {
        return .Development
    }
    
    var baseURL: String {
        switch networkEnvironment {
        case .Development:
            return ""
        case .Production:
            return ""
        case .Quality:
            return ""
        }
    }
    
    case getMovieList
    case getMovieDetails(Int)
    case castAndCrewDetails(Int)
    case getReviewData(Int)
    case getSimilarMoviesData(Int)
    case getMovieSearchResult(String)
    case getSearchMovieData(key: String, searchText: String)
}

extension NetworkAPI {
    var path: String {
        var servicePath = ""
        switch self {
        case .getMovieList:
            servicePath = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)"
        case .getMovieDetails(let id):
            servicePath = "https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiKey)"
        case .castAndCrewDetails(let id):
            servicePath = "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=\(apiKey)"
        case .getReviewData(let id):
            servicePath = "https://api.themoviedb.org/3/movie/\(id)/reviews?api_key=\(apiKey)"
        case .getSimilarMoviesData(let id):
            servicePath = "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=\(apiKey)"
        case .getMovieSearchResult(let searchString):
            servicePath = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(searchString)"
        case .getSearchMovieData(key: let key, searchText: let searchText):
            servicePath = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=a"
        }
        return servicePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    
   // var headers: HTTPHeaders!
}

