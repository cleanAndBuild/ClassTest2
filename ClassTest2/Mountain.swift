//
//  Mountain.swift
//  ClassTest
//
//  Created by Yako Kobayashi on 2018/07/26.
//  Copyright © 2018年 yako Kobayashi. All rights reserved.
//

import Foundation

class Mountain {
    var name:String = "" //山の名前
    var altitude:Double = 0 //標高
    var latitude:Double = 0 //緯度
    var longitude:Double = 0 //経度
    var description:String = "" //説明
    
    //初期化
    init(name:String,altitude:Double,latitude:Double,longitude:Double,description:String) {
        self.name = name //山の名前
        self.altitude = altitude //標高
        self.latitude = latitude //緯度
        self.longitude = longitude //軽度
        self.description = description //説明
    }
    
    //標高によって下がる気温を計算する
    func getPeakTemperature() -> Double {
        let minusTemperature = self.altitude * 0.006
        return minusTemperature
    }
}
