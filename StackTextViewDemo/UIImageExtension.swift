//
//  UIImageExtension.swift
//  Hikingbook
//
//  Created by kf on 2015/9/20.
//  Copyright © 2015年 Zheng-Xiang Ke. All rights reserved.
//

import UIKit

extension UIImage {
    func resizeWithScale(sx:CGFloat, sy:CGFloat) -> UIImage? {
        let size = self.size.applying(CGAffineTransform(scaleX: sx, y: sy))
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    func resizeWithSize(_ size: CGSize) -> UIImage? {
        var scale: CGFloat = 1
        if self.size.width > self.size.height {
            let maxWidth = min(size.width, self.size.width)
            scale = maxWidth / self.size.width
        }
        else {
            let maxHeight = min(size.height, self.size.height)
            scale = maxHeight / self.size.height
        }
        
        return resizeWithScale(sx: scale, sy: scale)
    }
}
