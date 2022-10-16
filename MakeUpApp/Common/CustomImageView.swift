//
//  CustomimageView.swift
//  MakeUpApp
//
//  Created by sweta makuwala on 16/10/22.
//

import Foundation
import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView
{
    var imageUrlString : String?
    func loadImgFromUrl(urlString: String){
     //   imageUrlString = urlString
//        if let imgFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
//            self.image = imgFromCache
//            return
//        }
        DispatchQueue.global(qos: .background).async {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) {( data, response , error )  in
            
            guard let data = data  else {return }
            DispatchQueue.main.async {
//                let imgToCache = UIImage(data: data)
//                if self.imageUrlString == urlString {
//                    self.image = imgToCache
//                }
//                imageCache.setObject(imgToCache as AnyObject, forKey: urlString as AnyObject)
//
                self.image = UIImage(data: data)
             }
        }
        task.resume()
        }
    }
    
}
