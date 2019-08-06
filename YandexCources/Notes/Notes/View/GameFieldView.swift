//
//  CustomView.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/5/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GameFieldView: UIView {
    
    @IBInspectable var objectColor: UIColor = .blue {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var objectPosition: CGPoint = .zero {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var objectSize: CGSize = CGSize(width: 60, height: 60) {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var isObjectHidden: Bool = true {
        didSet { setNeedsDisplay() }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        print("draw")
        
        guard !isObjectHidden else { return }
        
        let rectangle = getRectanglePath(in: CGRect(origin: objectPosition, size: objectSize))
        
        rectangle.fill()
    }
    
    func changeObjectPosition() {
        let maxX = bounds.width - objectSize.width
        let maxY = bounds.height - objectSize.height
        
        let randomX = CGFloat(arc4random_uniform(UInt32(maxX)))
        let randomY = CGFloat(arc4random_uniform(UInt32(maxY)))
        
        objectPosition = CGPoint(x: randomX, y: randomY)
    }
    
    private func getRectanglePath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        
        path.lineWidth = 0
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.close()
        path.stroke()
        
        objectColor.setFill()
        path.fill()
        
        return path
    }
}
