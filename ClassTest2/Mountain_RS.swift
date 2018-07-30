//
//  Mountain.swift
//  ClassTest
//
//  Created by Yako Kobayashi on 2018/07/26.
//  Copyright © 2018年 yako Kobayashi. All rights reserved.
//

import Foundation
import FMDB

class Mountain_RS : RecordSet {
    var id:Int = -1
    
    var name:String! = nil //山の名前
    var altitude:Double = 0 //標高
    var latitude:Double = 0 //緯度
    var longitude:Double = 0 //経度
    var description:String! = nil //説明
    
    //初期化
    
    init() {
    }
    
    init(name:String,altitude:Double,latitude:Double,longitude:Double,description:String) {
        self.name = name //山の名前
        self.altitude = altitude //標高
        self.latitude = latitude //緯度
        self.longitude = longitude //軽度
        self.description = description //説明
    }
    
    //レコードを変換する
    func toRecordSet(result:FMResultSet) {
        self.id = result.long(forColumnIndex:0)
        self.name = result.string(forColumnIndex:1)
        self.latitude = result.double(forColumnIndex:2)
        self.longitude = result.double(forColumnIndex:3)
        self.altitude = result.double(forColumnIndex:4)
        self.description = result.string(forColumnIndex:5)
    }
    
    //標高によって下がる気温を計算する
    func getPeakTemperature() -> Double {
        let minusTemperature = self.altitude * 0.006
        return minusTemperature
    }
}
