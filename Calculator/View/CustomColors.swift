//
//  CustomColors.swift
//  Calculator
//
//  Created by Mikita Piatrushka on 25.11.22.
//

import UIKit

public enum CustomColor {
    static let indigo = hexStringToUIColor(hex: "4B0082")
    static let blueViolete = hexStringToUIColor(hex: "8A2BE2")
    static let Cyan = hexStringToUIColor(hex: "00FFFF")
    static let blue = hexStringToUIColor(hex: "0000FF")
    static let darkOrchid = hexStringToUIColor(hex: "9932CC")
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
