//
//  NoteExtension.swift
//  Notes
//
//  Created by Timofei Sikorski on 6/26/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import Foundation
import UIKit

extension Note {
    var json: [String: Any] {
        var jsonDict = [String: Any]()
        
        jsonDict["uid"] = uid
        jsonDict["title"] = title
        jsonDict["content"] = content
        
        if color != UIColor.white {
            jsonDict["color"] = color.getDictionaryFrmt()
        }
        
        if importance != .normal {
            jsonDict["importance"] = importance.rawValue
        }
        
        if let date = selfDestructionDate {
            let frmt = DateFormatter()
            frmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let stringDate = frmt.string(from: date)
            
            jsonDict["selfDestructionDate"] = stringDate
        }
        
        return jsonDict
    }
    
    static func parse(json: [String: Any]) -> Note? {
        
        //TODO: insert guard(else return nil)
        let uid = json["uid"] as! String
        let title = json["title"] as! String
        let content = json["content"] as! String
        
        var color:UIColor {
            if let dictColor = json["color"] {
                return UIColor.parce(dictionary: dictColor  as! [String: Float])
            } else {
                return .white
            }
        }
        
        var importance: Importance {
            if let stringImportance = json["importance"] {
                return Importance(rawValue: stringImportance as! String)!
            } else {
                return .normal
            }
        }
    
        var date: Date? {
            if let selfDestructionDate = json["selfDestructionDate"] {
                let frmt = DateFormatter()
                frmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
                return frmt.date(from: selfDestructionDate as! String)
            } else {
                return nil
            }
        }
        
        return Note(uid: uid, title: title, content: content, color: color, importance: importance, selfDestructionDate: date)
    }
}

extension UIColor {
    func getDictionaryFrmt() -> [String: Float] {
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return ["red": Float(r), "green": Float(g), "blue": Float(b), "alpha": Float(a)]
    }
    
    class func parce(dictionary: [String: Float]) -> UIColor {
        return UIColor(red: CGFloat(dictionary["red"]!),
                       green: CGFloat(dictionary["green"]!),
                       blue: CGFloat(dictionary["blue"]!),
                       alpha: CGFloat(dictionary["alpha"]!))
    }
}
