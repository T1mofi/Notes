//
//  StartViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/12/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBAction func doctorControllerButtonClicked(_ sender: Any) {
        
        let doctorViewController = DoctorViewController()
        
        navigationController?.pushViewController(doctorViewController, animated: true)
    }
    
    @IBAction func medicineControllerButtonClicked(_ sender: Any) {
        
        let medicineViewController = MedicineViewController()
        
        navigationController?.pushViewController(medicineViewController, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Doctors"
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
