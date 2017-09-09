//
//  Response+HandyJSON.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import HandyJSON

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func mapData<T: HandyJSON>(_ type: T.Type) -> Single<T> {
        return flatMap({ response -> Single<T> in
            return Single.just(response.mapData(T.self))
        })
    }
}

extension Response {
    func mapData<T: HandyJSON>(_ type: T.Type) -> T {
        let jsonString = String.init(data: data, encoding: .utf8)
        return JSONDeserializer<T>.deserializeFrom(json: jsonString)!
    }
}
