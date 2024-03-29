//
//  Spoonacular.swift
//  SturicousApp
//
//  Created by Rj O'Neal on 4/9/22.
//


import Foundation
import UIKit
class SpoonacularAPICaller
{
    private static var apiKey:String = "57021b3f90dd45afae68b1f9a0316c93"
    private static var baseUrl:String = "https://api.spoonacular.com"
    static func getData(_ params:[String:Any], _ endPoint: String, success:@escaping ([String:Any]) -> ())
    { // suppose you receive an array
        // api call here {
        var components = URLComponents(string: "\(self.baseUrl)\(endPoint)")!
        components.queryItems = params.map { URLQueryItem(name: $0, value: String(describing: $1))
        }
        //let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let request = URLRequest(url: components.url!)
        print(components.url?.absoluteString)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request)
        { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                 success(dataDictionary)
             }
        }
        task.resume()
    }
}

    
//    static func getAPIData(_ params:[String:Any], _ endPoint: String, _ completion @escaping ([String:Any]) -> ())
//    {
//        let url = URL(string: "\(self.baseUrl)/\(endPoint)?apiKey=\(self.apiKey)")!
//        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//             // This will run when the network request returns
//             if let error = error {
//                    print(error.localizedDescription)
//             } else if let data = data {
//                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//
//             }
//        }
//        task.resume()
//    }



