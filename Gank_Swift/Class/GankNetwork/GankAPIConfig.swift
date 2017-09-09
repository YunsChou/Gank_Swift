//
//  GankAPIConfig.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit

class GankAPIConfig: APIConfig {

    //／ 在子类中重写该方法：配置域名
    override func configBaseURL() -> String {
        return "http://gank.io"
    }
    //／ 在子类中重写该方法：配置路径
    override func configUrl() -> String {
        return path
    }
    //／ 在子类中重写该方法：配置参数
    override func configParams() -> [String: Any] {
        return dict ?? [:]
    }
}
