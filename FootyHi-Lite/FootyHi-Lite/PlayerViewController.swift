//
//  PlayerViewController.swift
//  FootyHi-Lite
//
//  Created by Nick on 2022-04-09.
//

import UIKit
import Parse


class PlayerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var topScorers = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
//        SportDataAPICaller.getSoccerLeague()
        
        // Load list of teams each time
        // Do any additional setup after loading the view.
//        self.tableView.rowHeight = UITableView.automaticDimension
//        self.tableView.estimatedRowHeight = 150
        
        let url = URL(string: "https://app.sportdataapi.com/api/v1/soccer/topscorers?apikey=\(API_KEY)&season_id=1980")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                     print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
 
                 print(dataDictionary)
                 self.topScorers =  dataDictionary["data"] as! [[String: AnyObject]]
                 self.tableView.reloadData()

             }
        }
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topScorers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell

        let temp_player = topScorers[indexPath.row]
        let individual = temp_player["player"] as! [String:AnyObject]
        let name = individual["player_name"]
        let team = temp_player["team"] as! [String:AnyObject]
        let teamName = team["team_name"]
        let position = temp_player["pos"] as! Int
        let goalsDictionary = temp_player["goals"] as! [String:AnyObject]
        let totalGoal = goalsDictionary["overall"] as! Int
        
        cell.position.text = String(position)
        cell.playerName.text = name as! String
        cell.teamName.text = teamName as! String
        cell.goals.text = String(totalGoal)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 180
        }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
    }
    
    
}
