//
//  InformationView.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/10/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class InformationView: UIView {
    
    private let lastGameScoreLabel = UILabel()
    private let lastGameTimeLabel = UILabel()
    
    override var intrinsicContentSize: CGSize {
        let lastGameScoreLabelSize = lastGameScoreLabel.intrinsicContentSize
        let lastGameTimeLabelSize = lastGameTimeLabel.intrinsicContentSize
        
        let width = lastGameScoreLabelSize.width + lastGameTimeLabelSize.width
        let height: CGFloat
        if lastGameScoreLabelSize.height >= lastGameTimeLabelSize.height {
            height = lastGameScoreLabelSize.height
        } else {
            height = lastGameTimeLabelSize.height
        }
        
        return CGSize(width: width, height: height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("run init frame")
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("run init? coder")
        
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let lastGameScoreLabelSize = lastGameScoreLabel.intrinsicContentSize
        lastGameScoreLabel.frame = CGRect(
            origin: CGPoint(
                x: bounds.minX,
                y: bounds.minY
            ),
            size: lastGameScoreLabelSize
        )
        
        let lastGameTimeLabelSize = lastGameTimeLabel.intrinsicContentSize
        lastGameTimeLabel.frame = CGRect(
            origin: CGPoint(
                x: bounds.maxX - lastGameTimeLabelSize.width,
                y: bounds.minY
            ),
            size: lastGameTimeLabelSize
        )
    }
    
    private func setupViews() {
        
        print("run setupView")
        
        addSubview(lastGameScoreLabel)
        addSubview(lastGameTimeLabel)
        
        lastGameScoreLabel.translatesAutoresizingMaskIntoConstraints = true
        lastGameTimeLabel.translatesAutoresizingMaskIntoConstraints = true
        
        lastGameScoreLabel.text = "last game score"
        lastGameTimeLabel.text = "last game time"
        
    }
    
 
}
