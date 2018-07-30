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
    
    var mountains: [Mountain_RS] = []
    var number:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dbm:DBManager = DBManager(dbFileName:"mountain.db")
        if(dbm.isOK) {
            let results = dbm.execQuery(sql:"select * from mountain;")
            while results.next() {
                let rs = Mountain_RS()
                rs.toRecordSet(result: results)
                mountains.append(rs)
            }
        }
        
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
