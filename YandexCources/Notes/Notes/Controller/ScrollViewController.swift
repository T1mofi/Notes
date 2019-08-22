//
//  ScrollViewController.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/22/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageViews = [UIImageView]()
    let imageNames = ["doctor", "brain", "aidKit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for name in imageNames {
            let image = UIImage(named: name)
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            
            scrollView.addSubview(imageView)
            imageViews.append(imageView)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for (index, imageView) in imageViews.enumerated() {
            imageView.frame.size = scrollView.frame.size
            imageView.frame.origin.x = scrollView.frame.width * CGFloat(index)
            imageView.frame.origin.y = 0
        }
        
        let contentWidth = scrollView.frame.width * CGFloat(imageViews.count)
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.height)
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
