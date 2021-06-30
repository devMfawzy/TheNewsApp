//
//  NewsService.swift
//  TheNewsApp
//
//  Created by Mohamed Fawzy on 30/06/2021.
//

import Alamofire

class NewsService: NewsServiceProtocol {
        
    func getNews(page: Int, pageSize: Int, query: String, completion: @escaping (GetNewsResult) -> Void) {
        let parameters: Parameters = [API.ParamterKey.pageSize: pageSize, API.ParamterKey.page: page, API.ParamterKey.query: query, API.ParamterKey.sort: API.ParamterValue.publishDate, API.ParamterKey.api: API.ParamterValue.apiKey]
        let request = AF.request(API.baseURL, method: .get, parameters: parameters)
        request.responseDecodable(of: NewsListResponse.self) { (response) in
            if let response = response.value {
                completion(.success(response))
            } else if let error = response.error {
                completion(.failure(error.localizedDescription))
            } else {
                completion(.failure("Unexpected Error"))
            }
        }
    }
    
}
