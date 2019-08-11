//
//  UIImage+CITint.swift
//  ManualTint
//
//  Created by Ahmed Khalaf on 8/11/19.
//  Copyright © 2019 Ahmed Khalaf. All rights reserved.
//

import UIKit

extension UIImage {
    func colored(_ color: UIColor, at rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        
        guard
            let cropped = cgImage?.cropping(to: rect),
            let tintedPart = UIImage(cgImage: cropped).tinted(color)
            else { return nil }
        
        draw(at: .zero)
        tintedPart.draw(in: rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func tinted(_ color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        
        color.setFill()
        (renderingMode == .alwaysTemplate ? self : withRenderingMode(.alwaysTemplate)).draw(at: .zero)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
