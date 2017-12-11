//
//  ViewController.swift
//  pusherTutorial
//
//  Created by Cooper Kunz on 12/10/17.
//  Copyright © 2017 CooperKunz. All rights reserved.
//

import UIKit
import PusherSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = PusherClientOptions(
            host: .cluster("your cluster location") // for example, "us1"
        )
        
        pusher = Pusher(
            key: "your private key", // for example, "ff23dae482949402940"
            options: options
        )
        
        // subscribe to channel and bind to event
        let channel = pusher.subscribe("my-channel")
        
        let _ = channel.bind(eventName: "my-event", callback: { (data: Any?) -> Void in
            if let data = data as? [String : AnyObject] {
                if let message = data["message"] as? String {
                    print("Pusher message = " + message)
                }
            }
        })
        
        pusher.connect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

