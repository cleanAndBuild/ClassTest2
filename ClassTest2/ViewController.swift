//
//  ViewController.swift
//  ClassTest2
//
//  Created by Yako Kobayashi on 2018/07/29.
//  Copyright © 2018年 yako Kobayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelAltitude: UILabel!
    @IBOutlet var labelLatitude: UILabel!
    @IBOutlet var labelLongitude: UILabel!
    @IBOutlet var tvDescription: UITextView!
    @IBOutlet var labelMinus: UILabel!
    
    var mountains: [Mountain] = []
    var number:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mountains.append(Mountain(name: "富士山", altitude: 3776.0, latitude: 35.3608333, longitude: 138.7275, description: "日本の最高峰。夏は登山者で賑わう。"))
        mountains.append(Mountain(name: "高尾山", altitude: 598.0, latitude: 35.625156, longitude: 139.243652, description: "ミシュランにも載った信仰の山。年間40万人が訪れる。"))
        mountains.append(Mountain(name: "槍ヶ岳", altitude: 3180.0, latitude: 36.341946, longitude: 137.647507, description: "標高は日本5位。特徴的な穂先は遠くからでも判りやすい。"))
        mountains.append(Mountain(name: "筑波山", altitude: 877.0, latitude: 36.225278, longitude: 140.106667, description: "茨城県つくば市にある877mの山。西の男体山と東の女体山があり、女体山の方が高い。"))
        mountains.append(Mountain(name: "天保山", altitude: 4.53, latitude: 34.658066, longitude: 138.7275, description: "大阪の天保山公園にある日本で最も低い山。人口です。"))
        
        showMountain()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //現在のnumberに応じて山データを表示する
    func showMountain() {
        let mountain = mountains[number]
        
        labelName.text = mountain.name
        labelAltitude.text = String(format:"%.1f m",mountain.altitude)
        labelLatitude.text = String(format:"緯度%.5f",mountain.latitude)
        labelLongitude.text = String(format:"経度%.5f",mountain.longitude)
        tvDescription.text = mountain.description
        labelMinus.text = String(format: "平地より%.1f℃低い", mountain.getPeakTemperature())
    }
    
    //前の山データを表示する
    @IBAction func tapPrev(_ sender: Any) {
        if(number > 0) {
            number = number - 1
        }
        showMountain()
    }
    
    //次の山データを表示する
    @IBAction func tapNext(_ sender: Any) {
        if(number < mountains.count - 1) {
            number = number + 1
        }
        showMountain()
    }
    
}
