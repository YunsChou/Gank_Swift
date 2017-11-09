//
//  APIConfig.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit

public enum RequestMethod {
    case get
    case post
}

open class APIConfig {
    public var method: RequestMethod = .get
    public var baseURL: String = ""
    public var path: String = ""
    public var headers: [String : String]?
    
    // 配置基础数据
    public func APIMethod() -> RequestMethod {
        return method
    }
    
    public func APIBaseURL() -> String {
        return baseURL
    }
    
    public func APIPath() -> String {
        return path
    }
    
    public func APIHeaders() -> [String : String]? {
        return headers
    }
}
