//
//  HttpUtility.swift
//  MvvmDemoApp
//
//  Created by Codecat15 on 3/14/2020.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void, errorCompletion : @escaping(_ error: String?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                }
                catch let error{
                    _ = errorCompletion(error.localizedDescription)
                }
            }

        }.resume()
    }

    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void, errorCompletion : @escaping(_ error: String?)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

            if(data != nil && data?.count != 0)
            {
                do {

                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let error {
                    _ = errorCompletion(error.localizedDescription)
                }
            }
        }.resume()
    }
}
