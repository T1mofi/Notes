//
//  SecondViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/11/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
   
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
