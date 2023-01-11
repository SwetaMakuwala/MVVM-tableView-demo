//
//  CustomimageView.swift
//  MakeUpApp
//
//  Created by sweta makuwala on 16/10/22.
//


import UIKit

class ImageDownloadManager
{
    // (completionHandler: ( (_ data: Data) -> Void )? = nil)
   static var shared = ImageDownloadManager()
     func loadImgFromUrl(urlString: String, completionHandler: @escaping (_ data : Data?) -> Void){

        let concurrentQueue = DispatchQueue.init(label: "concurrentQueue", qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)

        concurrentQueue.async {
            
            guard let url = URL(string: urlString) else { return }
            let task = URLSession.shared.dataTask(with: url) {( data, response , error )  in
                
                guard let data = data  else {return }
                    _ = completionHandler(data)
    
            }
            task.resume()
        }
        }
            
    }
    

