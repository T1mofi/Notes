//
//  GameFieldView.swift
//  Notes
//
//  Created by Timofei Sikorski on 7/23/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit


@IBDesignable
class GameFieldView: UIView {
    
    @IBInspectable var gameObjectColor: UIColor = .blue
    @IBInspectable let gameObjectPosition: CGPoint = .zero
    @IBInspectable let gameObjectSize = CGSize(width: 40, height: 40)

    override func draw(_ rect: CGRect) {
        self.draw(rect)

        gameObjectColor.setFill()
        let path = getRectanglePath(in: CGRect(origin: gameObjectPosition, size: gameObjectSize))
        path.fill()
    }

    private func getRectanglePath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()

        path.lineWidth = 0
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.close()
        path.stroke()
        path.fill()

        return path
    }
}
