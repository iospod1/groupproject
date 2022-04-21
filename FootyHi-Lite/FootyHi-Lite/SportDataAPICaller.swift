//
//  SportDataAPICaller.swift
//  FootyHi-Lite
//
//  Created by Nick on 2022-04-15.
//

import UIKit
import BDBOAuth1Manager


class SportDataAPICaller: BDBOAuth1SessionManager {
    
//    static let client = SportDataAPICaller(baseURL: URL(string: "https://app.sportdataapi.com"), consumerKey: API_KEY, consumerSecret: <#T##String?#>)
    
    let KEY = API_KEY
    //let URL_Session = URLSession.shared
    
    var loginSuccess: (() -> ())?
    var loginFailure: ((Error) -> ())?
    
    func getLeagueStanding() {
        URLSession.shared.dataTask(with: URL(string: "https://app.sportdataapi.com/api/v1/soccer/standings?apikey=\(API_KEY)&season_id=456")!)
        { (data, response, error) -> Void in
            // Check if data was received successfully
            if error == nil && data != nil {
                do {
                    print("JSON Query Success!")
                    // Convert to dictionary where keys are of type String, and values are of any type
                    let JSONResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
                    // Access specific key with value of type String
                    let dataDict =  JSONResponse["data"] as! [String: AnyObject]
                    let Team = JSONResponse["team"] as! [String]
                    print(dataDict)
                } catch {
                    // Something went wrong
                    print("JSON Query Failed!")
                }
            }
        
        }.resume()
    }
       
//    func getSoccerLeague() -> [String] {
//        let url =
//        URL(string:"https://app.sportdataapi.com/api/v1/soccer/standings?apikey=\(API_KEY)&season_id=456")
//        URL_Session.dataTask(with: url!) { data, response, error in
//            print(data as Any)
//        }.resume()
//        return ["Success"]
//    }
    
    // Asynchronous Http call to your api url, using URLSession:
//    func getSoccerStandings() {
//
//
//    }
}
