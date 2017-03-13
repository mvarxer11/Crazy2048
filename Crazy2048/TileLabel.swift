//
//  TileLabel.swift
//  Crazy2048
//
//  Created by mvarxer on 17/3/11.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

class TileLabel: UIView {

    var value:Int {
        didSet {
            label.text = String(value)
            self.backgroundColor = tileColor
        }
    }
    var rank:Int //如 14，1表示行数4表示列数
    var tileColor:UIColor {
        //求值是2的多少次幂,再除以10.
        let ratio:CGFloat = min((CGFloat(log2(Double(value))) - 1 ) / 10.0, 1.0) //最大值为1
        return UIColor(hue: 1, saturation: ratio, brightness: 1, alpha: 1)
    }
    var label:UILabel!
    
    func setup() {
        label.textColor = .black
        label.text = String(value)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: self.bounds.width/1.6)
        label.adjustsFontSizeToFitWidth = true
        self.addSubview(label)
        self.backgroundColor = tileColor
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
    }
    
    
    //纯代码创建
    init(frame: CGRect,value:Int,rank:Int) {
        self.label = UILabel(frame:CGRect(x: frame.width*0.1, y: frame.height*0.1, width: frame.width*0.8, height: frame.height*0.8))
        self.value = value
        self.rank = rank
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        label.removeFromSuperview()
        label = nil
        print("tileLabel with (",rank,") has been deinitialized.")
    }

}
