//
//  ColorPickerViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/27/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    
    @IBOutlet weak var selectedColorView: UIView!
    @IBOutlet weak var brightnessSlider: UISlider!
    @IBOutlet weak var gradientView: GradientView!

    @IBAction func brightnessChanged(_ sender: UISlider) {
        let newBrightness = CGFloat(sender.value)
        let newColor = selectedColorView.backgroundColor?.withAlphaComponent(newBrightness)
        
        selectedColorView.backgroundColor = newColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientView.setup { [weak self] color in
            let currentColorBrightness = CGFloat(self?.brightnessSlider.value ?? 1)
            let colorWithBrightness = color.withAlphaComponent(currentColorBrightness)
            
            self?.selectedColorView.backgroundColor = colorWithBrightness
        }
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
