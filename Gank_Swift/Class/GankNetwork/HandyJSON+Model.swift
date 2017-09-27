//
//  HandyJSON+Model.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import Foundation
import RxSwift
import HandyJSON

extension HandyJSON {
    // 基础方法
    static func load(url: String, dict: [String : Any]?) -> Single<GankModel<Self>> {
        // 1、初始化config
        let config = GankAPIConfig.init(url: url, params: dict)
        // 2、使用MoyaProvider发起请求
        return APIServer.rx.request(.loadConfig(config))
            .filterSuccessfulStatusCodes()
            .debug()
            // 3、将数据转为<范型>模型
            .mapData(GankModel<Self>.self)
            // 4、统一处理异常信息
            .do(onNext: { (model) in
                print(model.error)
            }, onError: { (error) in
                // 系统出错提示：包含网络断开等信息
                print("error:" + error.localizedDescription)
            })
    }
    
    static func loadResults(url: String, dict: [String : Any]?) -> Single<[Self]> {
        return load(url: url, dict: dict).map({$0.results!})
    }

}
