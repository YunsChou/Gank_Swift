//
//  HomeModel.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit
import HandyJSON

struct HomeModel: HandyJSON {
    
    var id: String = ""
    var createAt: Date = Date()
    var publishedAt: Date = Date()
    var desc: String = ""
    var source: String = ""
    var type: String = ""
    var url: String = ""
    var used: String = ""
    var who: String = ""
}


