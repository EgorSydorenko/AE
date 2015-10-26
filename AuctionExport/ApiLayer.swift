//
//  ApiLayer.swift
//  AuctionExport
//
//  Created by Егор Сидоренко on 10/21/15.
//  Copyright © 2015 Егор Сидоренко. All rights reserved.
//

import Foundation
//import Alamofire

class ApiLayer
{
    static func testRequest()
    {
        let url = NSURL(string: "https://www.auctionexport.com/")
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        let bodyData = "data=something"
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request,
            completionHandler: {
            (data, response,error) -> Void in
            if error != nil {
                print("error=\(error)")
                return;
            }
            
            let jsonResponse = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            
            print(jsonResponse)
        })
        
        task.resume()
    }
}