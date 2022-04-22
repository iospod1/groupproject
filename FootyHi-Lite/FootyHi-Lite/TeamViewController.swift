//
//  TeamViewController.swift
//  FootyHi-Lite
//
//  Created by Nick on 2022-04-09.
//

import UIKit
import Parse
import AlamofireImage

class TeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var standings = [[String:AnyObject]]()
    
    var teamNames: [Int: String] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Load list of teams each time
        // Do any additional setup after loading the view.
        //        self.tableView.rowHeight = UITableView.automaticDimension
        //        self.tableView.estimatedRowHeight = 150
        // With standings API Load list of teams each time, with their stats and ID
        URLSession.shared.dataTask(with: URL(string: "https://app.sportdataapi.com/api/v1/soccer/standings?apikey=\(API_KEY)&season_id=1980")!)
        { [self] (data, response, error) -> Void in
            // Check if data was received successfully
            if error == nil && data != nil {
                do {
                    print("JSON Query Success!")
                    // Convert to dictionary where keys are of type String, and values are of any type
                    let JSONResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
                    // Access specific key with value of type String
 
                    let dataDict =  JSONResponse["data"] as! [String: AnyObject]
                    self.standings = dataDict["standings"] as! [[String: AnyObject]]
                    print(standings.count)
                    print(standings[0])
                    //print(dataDict)
//                    for singleTeam in standings {
//                        teams[singleTeam["team_id"] as! Int] = (singleTeam["points"] as! Int)
//                    }
                   // print(teams)
                    
                } catch {
                    // Something went wrong
                    print("JSON Query Failed!")
                }
            }
        }.resume()
        
        
//        URLSession.shared.dataTask(with: URL(string: "https://app.sportdataapi.com/api/v1/soccer/teams/\(teams.keys.first)?apikey=\(API_KEY)")!)
//        { [self] (data, response, error) -> Void in
//            // Check if data was received successfully
//            if error == nil && data != nil {
//                do {
//                    print("JSON Query Success!")
//                    // Convert to dictionary where keys are of type String, and values are of any type
//                    let JSONResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
//                    // Access specific key with value of type String
//                    let dataDict =  JSONResponse["data"] as! [String: AnyObject]
//                    teamNames[dataDict["team_id"] as! Int] = (dataDict["name"] as! String)
//                    print(teamNames.values)
//                } catch {
//                    // Something went wrong
//                    print("JSON Query Failed!")
//                }
//            }
//        }.resume()
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standings.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamCell
                
        let team = self.standings[indexPath.row]
        print(team)
        let teamPoints = team["points"]
        let teamId = team["team_id"] as? Int ?? 0
        cell.teamName.text = String(teamId)

        cell.teamPoints.text = teamPoints as? String

        cell.teamLogo.image = UIImage(named: "ChelseaFC")
 

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
    }
    
    
    
    
    

}
