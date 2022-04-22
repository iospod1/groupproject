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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
//        SportDataAPICaller.getSoccerLeague()
        
        // Load list of teams each time
        // Do any additional setup after loading the view.
//        self.tableView.rowHeight = UITableView.automaticDimension
//        self.tableView.estimatedRowHeight = 150
        
        URLSession.shared.dataTask(with: URL(string:
    "https://app.sportdataapi.com/api/v1/soccer/topscorers?apikey=\(API_KEY)&season_id=352")!)
        { (data, response, error) -> Void in
            // Check if data was received successfully
            if error == nil && data != nil {
                do {
                    print("JSON Query Success!")
                    // Convert to dictionary where keys are of type String, and values are of any type
                    let JSONResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
                    // Access specific key with value of type String
                    let dataDict =  JSONResponse["data"] as? [AnyObject]
                    //print(dataDict)
                } catch {
                    // Something went wrong
                    print("JSON Query Failed!")
                }
            }
        
        }.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell

        
        cell.playerName.text = "Aaron Ramsey"
        cell.teamName.text = "Arsenal FC"
        cell.playerPortrait.image = UIImage(named: "AaronRamsey")
      
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
