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
    var teams = [[String:AnyObject]] ()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Load list of teams each time
        // Do any additional setup after loading the view.
        //        self.tableView.rowHeight = UITableView.automaticDimension
        //        self.tableView.estimatedRowHeight = 150
        // With standings API Load list of teams each time, with their stats and ID

        let url = URL(string: "https://app.sportdataapi.com/api/v1/soccer/standings?apikey=\(API_KEY)&season_id=1980")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                     print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 let dataDict =  dataDictionary["data"] as! [String: AnyObject]
                 self.standings = dataDict["standings"] as! [[String: AnyObject]]
                 self.tableView.reloadData()

             }
        }
        
        task.resume()
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standings.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamCell
                
        let team = standings[indexPath.row]
        let teamPoints = team["points"] as? Int ?? 0
        let teamId = team["team_id"] as? Int ?? 0
        let teamName = getTeamName(team_id: teamId)
        
        cell.teamName.text = String(teamId)
        //print(teamName)
        cell.teamPoints.text = String(teamPoints)
        //print(teamPoints)
        cell.teamLogo.image = UIImage(named: "ChelseaFC")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func getTeamName (team_id: Int) -> String {
        var teamName = ""
        let teamUrl = URL(string: "https://app.sportdataapi.com/api/v1/soccer/teams/\(team_id)?apikey=\(API_KEY)")!
        let teamRequest = URLRequest(url: teamUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let teamSession = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let teamTask = teamSession.dataTask(with: teamRequest) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                     print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 let dataDict =  dataDictionary["data"] as! [String: AnyObject]
                 teamName = dataDict["short_code"] as! String
                 print(teamName)
                 self.tableView.reloadData()
             }
        }
        
        return teamName
    }

    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
    }
    
    
    
    
    

}
