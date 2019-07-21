//
//  UIViewExtension.swift
//  Notes
//
//  Created by Timofei Sikorski on 7/12/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView { }
//@IBDesignable class DesignableButton: UIButton { }
//@IBDesignable class DesignableLabel: UILabel { }
//@IBDesignable class DesignableVisualEffectView: UIVisualEffectView { }

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}
