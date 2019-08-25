//
//  StackSubviewesViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/24/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class StackSubviewesViewController: UIViewController {

    @IBOutlet weak var verticalStackView: UIStackView!
    
    let colorViewController1 = ColorViewController()
    let colorViewController2 = ColorViewController()
    let colorViewController3 = ColorViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addInStack(viewController: colorViewController1)
        addInStack(viewController: colorViewController2)
        addInStack(viewController: colorViewController3)

    }
    
    func addInStack(viewController: UIViewController) {
        viewController.willMove(toParent: self)
        self.addChild(viewController)
        verticalStackView.addArrangedSubview(viewController.view)
        viewController.didMove(toParent: self)
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
