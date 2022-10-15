//
//  ActivityIndicatorClass.swift
//  MakeUpApp
//
//  Created by sweta makuwala on 13/10/22.
//

import Foundation
import UIKit

class ActivityIndicatorClass{
    static let shared = ActivityIndicatorClass()
    var indicator = UIActivityIndicatorView()
    
    func presentActivityIndicator(vc : ViewController) {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.center = vc.view.center
        indicator.backgroundColor = .white
        indicator.startAnimating()
        
        vc.view.addSubview(indicator)
    }
    
    func removeActivityIndicator(vc : ViewController){
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true 
        indicator.removeFromSuperview()
    }
    
}

