//
//  SecondViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/12/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    var text: String = "prepare segue err"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = text
        // Do any additional setup after loading the view.
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
