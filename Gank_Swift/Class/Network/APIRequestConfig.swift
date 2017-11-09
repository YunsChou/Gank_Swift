//
//  APIRequestConfig.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/11/9.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import Foundation

open class APIRequestConfig: APIBaseConfig {
    
    // 参数
    public var params: [String : Any]?
    // 初始化方法
    init(url: String, dict: [String : Any]?) {
        super.init()
        path = url
        params = dict
    }
    // 配置GET参数
    public func APIParams() -> [String : Any] {
        return params ?? [:]
    }
}
