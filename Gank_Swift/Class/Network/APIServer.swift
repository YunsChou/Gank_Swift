//
//  APIServer.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit
import Moya

let APIServer = MoyaProvider<APIManager>()

enum APIManager {
    case loadConfig(APIConfig)
}

extension APIManager: TargetType {
    var baseURL: URL {
        switch self {
        case .loadConfig(let config):
            return URL(string: config.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .loadConfig(let config):
            return config.url
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .loadConfig(let config):
            switch config.method {
            case .get:
                return .get
            default:
                return .post
            }
        }
    }

    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .loadConfig(let config):
            return .requestParameters(parameters: config.params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .loadConfig(let config):
            return config.headers
        }
    }
}
