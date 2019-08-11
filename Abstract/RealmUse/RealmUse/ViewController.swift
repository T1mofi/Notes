//
//  ViewController.swift
//  RealmUse
//
//  Created by Timofei Sikorski on 4/15/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        let cat = Cat()
        cat.model = "meercedes 500"
        cat.power = "220"
        
        try! realm.write {
            realm.add(cat)
        }
        
        let realmContain = realm.objects(Cat.self)
        print(realmContain)
        
        
    }


}

