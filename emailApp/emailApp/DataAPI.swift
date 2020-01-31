//
//  DataAPI.swift
//  emailApp
//
//  Created by Bhumit Muchhadia on 2020-01-31.
//  Copyright © 2020 Bhumit Muchhadia. All rights reserved.
//

import UIKit

class DataAPI: NSObject {
    
    
    // ****** This would be rest api code *****//
    
    //       private func CallGiffyAPI(apiURL:URL,completion:@escaping completionHandler) {
    //           var request = URLRequest(url: apiURL)
    //           request.httpMethod = "GET"
    //           request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    //           URLSession.shared.dataTask(with: request) { (data, response, error) in
    //               if let response = response {print(response)}
    //               if let data = data {
    //                   do {
    //                       let json = try JSON(data: data)
    //                       completion(json)
    //                       return}
    //                   catch {
    //                       print(error)
    //                       completion([:])
    //                       return
    //                   }}
    //               completion([:])
    //               return;
    //               }.resume()
    //       }
    
    public func SendEmail() -> Bool{
        return true;
    }
    public func DeleteEmail(key:String, name:String, subject:String ){
        var dict =    UserDefaults.standard.value(forKey: key) as! [[String : String]]
        if dict.count == 0{
            return
        }
        let countInt = dict.count - 1
        for i in 0 ... countInt{
            if dict[i]["name"] == name  && dict[i]["subject"] == subject{
                dict.remove(at: i)
                break
            }
        }
        UserDefaults.standard.setValue(dict, forKey: key)
    }
    
    public func addEmail(key:String, name:String, subject:String,body: String ){
        var dict =  UserDefaults.standard.value(forKey: key) as? [[String:String]]
        let userDefaults = UserDefaults.standard
        if dict == nil{
            dict = [["name":name,"subject":subject,"body":body]]
            userDefaults.set(dict, forKey: key)
            userDefaults.synchronize()
            return
        }
        dict?.append(["name":name,"subject":subject,"body":body])
        UserDefaults.standard.setValue(dict, forKey: key)
        
    }
    
    public func fetchData(key:String) -> [[String:String]]{
        let dict =  UserDefaults.standard.value(forKey: key) as? [[String:String]]
        if dict == nil && key == "EmailList" {
            let dummydata = [["name":"mike","subject":"School","body":"did you finish the project"],["name":"Jon","subject":"TV","body":"Whats you're favorite show"],["name":"bob","subject":"Food","body":"Lets eat something"]]
            UserDefaults.standard.setValue(dummydata, forKey: "EmailList")
            return dummydata
        }
        else if (dict == nil ){
            
            UserDefaults.standard.setValue([], forKey: key)
             return []
        }
        else if (dict?.count == 0 && key == "EmailList"){
            let dummydata = [["name":"mike","subject":"School","body":"did you finish the project"],["name":"Jon","subject":"TV","body":"Whats you're favorite show"],["name":"bob","subject":"Food","body":"Lets eat something"]]
            UserDefaults.standard.setValue(dummydata, forKey: "EmailList")
            return dummydata
        }
        else{
            return dict!
        }
    }
}
