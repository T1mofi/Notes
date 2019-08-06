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
    
    @IBInspectable var objectColor: UIColor = .blue
    @IBInspectable var objectPosition: CGPoint = .zero
    @IBInspectable var objectSize: CGSize = CGSize(width: 60, height: 60)
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        print("draw")
        
        let rectangle = getRectanglePath(in: CGRect(origin: objectPosition, size: objectSize))
        
        rectangle.fill()
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
