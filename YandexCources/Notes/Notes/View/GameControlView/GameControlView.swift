//
//  GameControlView.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/8/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GameControlView: UIView {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameTimeLabel: UILabel!

    @IBAction func stepperChanged(_ sender: UIStepper) {
        gameTimeLabel.text = "Game time \(Int(sender.value)) sec"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        let xibView = loadFromXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
    }
    
    private func loadFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "GameControlView", bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first! as! UIView
    }
}
