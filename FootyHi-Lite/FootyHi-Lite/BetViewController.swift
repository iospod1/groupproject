//
//  BetViewController.swift
//  FootyHi-Lite
//
//  Created by Nick on 2022-04-09.
//

import UIKit
import Parse

class BetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var matches = [[String: AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string: "https://app.sportdataapi.com/api/v1/soccer/matches?apikey=\(API_KEY)&season_id=1980&date_from=2022-04-25&date_to=2022-05-22")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                     print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]

                 print(dataDictionary)
                 self.matches =  dataDictionary["data"] as! [[String: AnyObject]]
                 self.tableView.reloadData()

             }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BetCell", for: indexPath) as! BetCell
        
        let currentMatch = matches[indexPath.row]
        
        let home = currentMatch["home_team"] as! [String:AnyObject]
        let homeTeam = home["name"] as! String
        let homeImageURL = URL(string: (home["logo"] as? String)!)
        let homeImage = try? Data(contentsOf: homeImageURL!)
        
        let away = currentMatch["away_team"] as! [String:AnyObject]
        let awayTeam = away["name"] as! String
        let awayImageURL = URL(string: (away["logo"] as? String)!)
        let awayImage = try? Data(contentsOf: awayImageURL!)
        
        
        cell.homeTeam.text = homeTeam
        if homeTeam == "Southampton FC" {
            cell.homeLogo.image = UIImage(named: "st")
        }
        else {
            cell.homeLogo.image = UIImage(data: homeImage!)
        }
       
        
        cell.awayTeam.text = awayTeam
        if awayTeam == "Southampton FC" {
            cell.awayLogo.image = UIImage(named: "st")
        }
        else {
            cell.awayLogo.image = UIImage(data: awayImage!)
        }
        
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
