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
