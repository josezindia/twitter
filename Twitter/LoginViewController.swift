//
//  LoginViewController.swift
//  Twitter
//
//  Created by Jose Zindia on 11/11/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var onLoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //onLoginButton.layer.cornerRadius = 18
        onLoginButton.layer.cornerRadius = onLoginButton.bounds.size.height/2
        
     
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userloggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
           
            UserDefaults.standard.set(true, forKey: "userloggedIn")
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not login")
        })
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
