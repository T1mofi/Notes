//
//  DoctorViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/12/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class DoctorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Doctor"
        
        navigationController?.navigationBar.backgroundColor = UIColor.black
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.startAnimating()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicator)
        
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
