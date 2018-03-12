//
//  APIConfig.swift
//  ZXCARMANAGER
//
//  Created by Yuns on 2018/3/8.
//  Copyright © 2018年 ZXEVPOP. All rights reserved.
//

import Foundation

public enum APIEncodingType {
    case URL
    case JSON
}

public enum APIRequestMethod {
    case get
    case post
}

open class APIConfig: NSObject {
    var requestEncodingType: APIEncodingType = .URL
    var requestMethod: APIRequestMethod = .get
    
    var requestBaseURLString: String = ""
    var requestPath: String = ""
    var requestParams: [String : Any]?
    var requestHeaders: [String : String]?
    
    init(baseURLString: String, method: APIRequestMethod = .get, encodingType: APIEncodingType = .URL, path: String, params: [String : Any]?) {
        super.init()
        requestBaseURLString = baseURLString
        requestMethod = method
        requestEncodingType = encodingType
        requestPath = path
        requestParams = params
    }
    
    // 处理参数
    func APIBaseURL() -> URL {
        return URL.init(string: requestBaseURLString)!
    }
}
