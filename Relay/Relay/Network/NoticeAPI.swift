//
//  NoticeAPI.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation
import Moya
import RxAlamofire
import RxSwift

enum NoticeService {
    case list
}

extension NoticeService: TargetType {
    var baseURL: URL {
        URL(string: APIConstants.BASE_URL+"/notice")!
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

class NoticeAPI {
    
    static var authPlugin = AuthPlugin()
    static var provider = MoyaProvider<NoticeService>(plugins: [authPlugin])

    static func list() -> Single<Response> {
        return provider.rx.request(.list)
    }
}
