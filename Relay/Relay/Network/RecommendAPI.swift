//
//  RecommendAPI.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation
import Moya
import RxAlamofire
import RxSwift

enum RecommendService {
    case retrieve
}

extension RecommendService: TargetType {
    
    var baseURL: URL {
        URL(string: APIConstants.BASE_URL + "/recommend")!
    }
    
    var path: String {
        return "/"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["content-type": "application/json"]
    }
}

class RecommendAPI {
    
    static var authPlugin = AuthPlugin()
    static var provider = MoyaProvider<RecommendService>(plugins: [authPlugin])

    static func retrieve() -> Single<Response> {
        return provider.rx.request(.retrieve)
    }
}
