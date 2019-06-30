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
    
    enum Importance: String {
        case unimportant
        case normal
        case important
    }
    
    let uid:String
    let title:String
    let content:String
    let color:UIColor
    let importance:Importance
    let selfDestructionDate:Date?
    
    init(uid: String = UUID().uuidString,
         title: String = "Title",
         content: String = "Content",
         color: UIColor = UIColor.white,
         importance: Importance = .normal,
         selfDestructionDate: Date? = nil)
    {
        self.title = title
        self.content = content
        self.color = color
        self.importance = importance
        self.selfDestructionDate = selfDestructionDate
        self.uid = uid
    }
}

