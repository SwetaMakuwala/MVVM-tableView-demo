//
//  MakeUpResource.swift
//  MakeUpApp
//
//  Created by sweta makuwala on 10/10/22.
//

import Foundation
struct ViewModel
{
    func getproducts(completion: @escaping(_ result : MemeResponse?) -> Void, errorCompletion:@escaping(_ error  : String?) -> Void )
    {
        let httpUtility = HttpUtility()

        guard  let requestUrl = URL(string:ApiEndpoints.getMeme) else {return }

//        httpUtility.getApiData(requestUrl: requestUrl, resultType: MemeResponse.self) { (memeResponse) in
//            _ = completion(memeResponse)
//        }
        httpUtility.getApiData(requestUrl: requestUrl, resultType: MemeResponse.self) {
            (memeResponse) in
            _ = completion(memeResponse)
        } errorCompletion: { error in
            _ = errorCompletion(error)
        }

    }
}
// func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void, errorCompletion : @escaping(_ error: String?)-> Void)
