//
//  RecommendDataService.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/06/04.
//

import Foundation

import Alamofire

struct RecommendDataService {
    
    static let shared = RecommendDataService()
    
    func getRecommendData(completion: @escaping (NetworkResult<Any>) -> ()) {
        
        let url = Constants.recommendURL
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: headers)
        
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success(_):
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let data = dataResponse.value else { return }
                
                let networkResult = self.judgeRecommendStatus(status: statusCode,
                                                         data: data)
                completion(networkResult)
                
            case .failure(_):
                completion(.pathErr)
            }
            
        }
        
    }
    
    private func judgeRecommendStatus(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodeData = try? decoder.decode(RecommendDataModel.self, from: data)
        else { return .pathErr }

        return .success(decodeData)
    }
}
