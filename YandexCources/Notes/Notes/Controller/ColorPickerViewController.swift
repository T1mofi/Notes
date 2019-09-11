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
    
    var initialColor: UIColor?
    
    //TODO: rename this(transfer color to viewController?)
    private var selectedColorCallback: ((UIColor) -> Void)?

    @IBAction func brightnessChanged(_ sender: UISlider) {
        let newBrightness = CGFloat(sender.value)
        let newColor = selectedColorView.backgroundColor?.withAlphaComponent(newBrightness)
        
        selectedColorView.backgroundColor = newColor
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        selectedColorCallback?(selectedColorView.backgroundColor ?? .red)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set color from previev ViewController
        selectedColorView.backgroundColor = initialColor
        
        gradientView.configureColorUpdater { [weak self] color in
            let currentColorBrightness = CGFloat(self?.brightnessSlider.value ?? 1)
            let colorWithBrightness = color.withAlphaComponent(currentColorBrightness)
            
            self?.selectedColorView.backgroundColor = colorWithBrightness
        }
    }
    
    func configureColorCallback(with selectedColorCallback: @escaping (UIColor) -> Void) {
        self.selectedColorCallback = selectedColorCallback
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
