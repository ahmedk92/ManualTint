//
//  ViewController.swift
//  ManualTint
//
//  Created by Ahmed Khalaf on 8/11/19.
//  Copyright © 2019 Ahmed Khalaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    private var rect: CGRect = .zero
    
    @objc private func colorAndAdvance() {
        guard let image = imageView.image else { return }
        
        rect.size.height = image.size.height
        rect.size.width = image.size.width * 0.2
        rect.origin.x = (rect.minX + rect.width * 0.05).truncatingRemainder(dividingBy: image.size.width)
        
        imageView.image = UIImage(named: "text")!.colored(.red, at: rect)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let link = CADisplayLink(target: self, selector: #selector(colorAndAdvance))
        link.add(to: .current, forMode: .default)
    }


}
