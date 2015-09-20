//
//  UIColor+Extension.swift
//  ARNPageContainer-Swift
//
//  Created by xxxAIRINxxx on 2015/09/09.
//  Copyright (c) 2015 xxxAIRINxxx. All rights reserved.
//

import UIKit

public struct RGBA {
    var red : CGFloat = 0.0
    var green : CGFloat = 0.0
    var blue : CGFloat = 0.0
    var alpha  : CGFloat = 0.0
}

public extension UIColor {
    
    public func getRGBAStruct() -> RGBA {
        let components = CGColorGetComponents(self.CGColor)
        let colorSpaceModel = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor))
        
        if colorSpaceModel.rawValue == CGColorSpaceModel.RGB.rawValue && CGColorGetNumberOfComponents(self.CGColor) == 4 {
            return RGBA(
                red: components[0],
                green: components[1],
                blue: components[2],
                alpha: components[3]
            )
        } else if colorSpaceModel.rawValue == CGColorSpaceModel.Monochrome.rawValue && CGColorGetNumberOfComponents(self.CGColor) == 2 {
            return RGBA(
                red: components[0],
                green: components[0],
                blue: components[0],
                alpha: components[1]
            )
        } else {
            return RGBA()
        }
    }
}