//
//  Note.swift
//  Notes
//
//  Created by Timofei Sikorski on 6/20/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import Foundation
import UIKit

struct Note {
    
    enum Importance {
        case unimportant
        case normal
        case important
    }
    
    let uid:String
    let title:String
    let content:String
    let color:UIColor
    let importance:Importance
    let selfDistractionDate:Date?
    
    init(title:String = "Title", content:String = "Content", color:UIColor = UIColor.white, importance:Importance = .normal, selfDistractionDate:Date? = nil) {
        self.title = title
        self.content = content
        self.color = color
        self.importance = importance
        self.selfDistractionDate = selfDistractionDate
        
        uid = UUID().uuidString
    }
}

