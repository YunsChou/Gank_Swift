//
//  GankAPIConfig.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit

class GankAPIConfig: APIGetConfig {
    
    //／ 在子类中重写该方法：配置域名
    override func APIBaseURL() -> String {
        return "http://gank.io"
    }
}
