//
//  StoryAPI.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation
import Moya
import RxAlamofire
import RxSwift

enum StoryService {
    
    case create(genre: String, title: String, content: String, bgm: Int, step_limit: Int)
    case list(finished: Bool?, genre: String?, order: Bool?)
    case retrieve(storyId: Int)
    case delete(storyId: Int)
    case like(storyId: Int)
}

extension StoryService: TargetType {
    
    var baseURL: URL {
        URL(string: APIConstants.BASE_URL+"/story")!
    }
    
    var path: String {
        switch self {
        case .create:
            return "/"
        case .list:
            return "/"
        case let .retrieve(storyId):
            return "/\(storyId)/"
        case let .delete(storyId):
            return "/\(storyId)/"
        case let .like(storyId):
            return "/\(storyId)/like/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .create:
            return .post
        case .list:
            return .get
        case .retrieve:
            return .get
        case .delete:
            return .delete
        case .like:
            return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .create(genre, title, content, bgm, step_limit):
            var multipart: [MultipartFormData] = []
            let genreData = MultipartFormData(provider: .data(genre.data(using: .utf8)!), name: "genre")
            let titleData = MultipartFormData(provider: .data(title.data(using: .utf8)!), name: "title")
            let contentData = MultipartFormData(provider: .data(content.data(using: .utf8)!), name: "content")
            let bgmData = MultipartFormData(provider: .data("\(bgm)".data(using: .utf8)!), name: "bgm")
            let step_limitData = MultipartFormData(provider: .data("\(step_limit)".data(using: .utf8)!), name: "step_limit")
            multipart.append(contentsOf: [genreData, titleData, contentData, bgmData, step_limitData])
            return .uploadMultipart(multipart)
            
        case let .list(finished, genre, order):
            var dict: [String: String] = [:]
            if let finished = finished {
                dict["finished"] = "\(finished)"
            }
            if let genre = genre {
                dict["genre"] = "\(genre)"
            }
            if let order = order {
                dict["order"] = "\(order)"
            }
            
            return .requestParameters(parameters: dict, encoding: URLEncoding.queryString)
            
        case .retrieve:
            return .requestPlain
            
        case .delete:
            return .requestPlain
            
        case .like:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .create:
            return ["Content-type": "multipart/form-data"]
        default:
            return ["Content-type": "application/json"]
        }
    }
}

class StoryAPI {
    
    private static var authPlugin = AuthPlugin()
    private static var provider = MoyaProvider<StoryService>(plugins: [authPlugin])
    static func create(genre: String, title: String, content: String, bgm: Int, step_limit: Int) -> Observable<ProgressResponse> {
        return provider.rx.requestWithProgress(.create(genre: genre, title: title, content: content, bgm: bgm, step_limit: step_limit))
    }
    static func list(finished: Bool? = nil, genre: String? = nil, order: Bool? = nil) -> Single<Response> {
        return provider.rx.request(.list(finished: finished, genre: genre, order: order))
    }
    static func retrieve(storyId: Int) -> Single<Response> {
        return provider.rx.request(.retrieve(storyId: storyId))
    }
    static func delete(storyId: Int) -> Single<Response> {
        return provider.rx.request(.delete(storyId: storyId))
    }
    static func like(storyId: Int) -> Single<Response> {
        return provider.rx.request(.like(storyId: storyId))
    }
}


