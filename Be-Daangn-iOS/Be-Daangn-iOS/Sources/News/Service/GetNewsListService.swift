//
//  GetNewsListService.swift
//  Be-Daangn-iOS
//
//  Created by 김혜수 on 2021/06/03.
//

import Foundation
import Alamofire

// 통신하는 부분!!!!!

struct GetNewsListService{
    // 1. 싱글턴 패턴 인스턴스 생성
    static let shared = GetNewsListService()
    
    func getNews(completion : @escaping (NetworkResult<Any>) -> Void) {
        // 2.  @escaping 클로저를 사용해 escape closure형태로 completion을 정의한다.
        // 해당 네트워크 작업이 끝날 때 네트워크 결과를 호출한다.
        
        // 3. 데이터를 받아오려는 주소를 정의함
        let URL = "http://15.164.251.55:5000/api/main/news"
        
        // 4. 필요한 헤더를 key-value형태로 정의함 (나중에 서버 붙일때 필요한 헤더 있는지 확인할 것)
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        // 5. 요청서 작성
        // (주소)로 (Get)방식을 이용해 (JSONEncoding)방식으로 (header)정보를 헤더에 담아 Request를 보내기 위한 정보를 묶어 dataRequest에 저장함
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // 6. 통신이 완료되면 클로저를 통해 dataRequest라는 이름으로 결과가 도착한다.
        /*
         dataResponse.result => 통신이 성공했는지 실패했는지 여부
         dataResponse.response?.statusCode => Response의 statusCode
         dataResponse.value => Response의 결과 데이터
         */
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            // 통신이 성공했는지, 실패했는지 판단
            case .success:
                // statuscode값 저장해놓기 (ex. 200, 400 이런거)
                guard let statusCode = dataResponse.response?.statusCode else {
                    return
                }
                
                // response 결과 데이터 저장해놓기
                guard let value = dataResponse.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            // 통신이 실패한 경우(아예 통신 자체의 실패)
            case .failure:
                completion(.pathErr)
            }
            
            
        }
        
    }
    
    // statusCode를 바탕으로 어떻게 결과값을 처리할지 정의함.
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        // 200 : 성공한 경우 (isValidData로 데이터 넘겨줌)
        case 200:
            return isValidData(data: data)
        // 400 : 요청이 잘못되었다는 경우 .pathErr 리턴
        case 400:
            return .pathErr
        // 500 : 서버 에러
        case 500:
            return .serverErr
        // 기타 : 네트워크 에러
        default:
            return .networkFail
        }
    }
    
    // statusCode가 200대 일 때 데이터를 가공하기 위한 함수
    private func isValidData(data: Data)-> NetworkResult<Any> {
        
        // JSON데이터 해독
        let decoder = JSONDecoder()
        
        
        // Decode하는 중... -> 실해파면 pathErr
        guard let decodeData = try? decoder.decode(NewsListDataModel.self, from: data)
        else { return .pathErr }
        
        
        
        // 성공하면 success
        return .success(decodeData.data)
        
    }
}
