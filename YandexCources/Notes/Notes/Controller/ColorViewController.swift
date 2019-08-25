//
//  ColorViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/24/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false

        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        label.text = "super text"
        label.font = .boldSystemFont(ofSize: 30)
        
        view.backgroundColor = .blue
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
