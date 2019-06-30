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
        
        if let date = selfDistractionDate {
            let frmt = DateFormatter()
            frmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let stringDate = frmt.string(from: date)
            
            jsonDict["selfDistractionDate"] = stringDate
        }
        
        return jsonDict
    }
    
    static func parse(json: [String: Any]) -> Note? {
        let uid = json["uid"] as! String
        let title = json["title"] as! String
        let content = json["content"] as! String
        
        let color:UIColor
        if let dictColor = json["color"] {
            color = UIColor.parce(dictionary: dictColor  as! [String: Float])
        } else {
            color = .white
        }
        
        let importance: Importance
        if let stringImportance = json["importance"] {
            importance =  Importance(rawValue: stringImportance as! String)!
        } else {
            importance = .normal
        }
    
        let date: Date? = nil
        
        return Note(uid: uid, title: title, content: content, color: color, importance: importance, selfDistractionDate: date)
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
