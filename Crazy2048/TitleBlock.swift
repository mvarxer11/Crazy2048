//
//  TitleBlock.swift
//  Crazy2048
//
//  Created by mvarxer on 17/3/12.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

@IBDesignable
class TitleBlock: UIView {

    @IBInspectable var backColor:UIColor = UIColor.black { didSet { setNeedsDisplay() }}
    @IBInspectable var string1:String = "default" { didSet { setNeedsDisplay() }}
    @IBInspectable var string2:String = "default" { didSet { setNeedsDisplay() }}
    @IBInspectable var round:CGFloat = 10
    fileprivate var title1:UILabel!
    fileprivate var title2:UILabel!
    
    public func setStringValue(string:String) {
        title2.text = String(string)
    }
    
    public func getValue() -> Int {
        return Int(title2.text!)!
    }
    
    override func draw(_ rect: CGRect) {
        title1 = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width*0.45, height: self.bounds.height))
        title1.text = string1
        title1.textColor = .white
        title1.backgroundColor = backColor
        title1.textAlignment = .center
        title2 = UILabel(frame: CGRect(x: self.bounds.width*0.5, y: 0, width: self.bounds.width*0.5, height: self.bounds.height))
        title2.text = string2
        title2.textColor = .black
        title2.backgroundColor = .white
        title2.textAlignment = .left
        self.addSubview(title1)
        self.addSubview(title2)
        self.layer.cornerRadius = round
        self.layer.borderWidth = 1
        self.layer.borderColor = backColor.cgColor
        self.clipsToBounds = true
    }
}
