//
//  RelayAPI.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation
import Moya
import RxAlamofire
import RxSwift

enum RelayService {
    
    case create(storyId: Int, content: String)
    case list(storyId: Int)
}

extension RelayService: TargetType {
    
    var baseURL: URL {
        URL(string: APIConstants.BASE_URL + "/relay")!
    }
    
    var path: String {
        switch self {
        case let .create(storyId, _):
            return "/story/\(storyId)/" // Ex) /relay/story/1/
        case let .list(storyId):
            return "/story/\(storyId)/" // Ex) /relay/story/1/
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .create:
            return .post
        case .list:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .create(_, content):
            return .requestJSONEncodable(["content": content])
        case .list:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["content-type": "application/json"]
    }
}

class RelayAPI {
    
    static var authPlugin = AuthPlugin()
    static var provider = MoyaProvider<RelayService>(plugins: [authPlugin])
    
    static func create(storyId: Int, content: String) -> Observable<ProgressResponse> {
        return provider.rx.requestWithProgress(.create(storyId: storyId, content: content))
    }
    static func list(storyId: Int) -> Single<Response> {
        return provider.rx.request(.list(storyId: storyId))
    }
}
