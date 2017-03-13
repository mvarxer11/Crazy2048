//
//  NextTile.swift
//  Crazy2048
//
//  Created by mvarxer on 17/3/12.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit



@IBDesignable
class NextTile: UIView {

    var nextTile:TileLabel!
    var number:Int = 2
    public func setNextNumber(n:Int) {
        self.number = n
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        if nextTile != nil {
            nextTile.removeFromSuperview()
            nextTile = nil
        }
        let _frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        nextTile = TileLabel(frame: _frame, value: number, rank: 0)
        self.addSubview(nextTile)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
