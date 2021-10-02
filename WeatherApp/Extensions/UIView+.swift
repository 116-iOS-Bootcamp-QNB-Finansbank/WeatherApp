//
//  UIView+.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 26.09.2021.
//

import UIKit

extension UIView {
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}
