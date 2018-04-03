//
//  ViewController.swift
//  VPN
//
//  Created by Danny on 03/04/2018.
//  Copyright © 2018 Danny. All rights reserved.
//

import Cocoa
import NetworkExtension


class ViewController: NSViewController {
    var vpnRunning = false
    var manager = NEVPNManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func startVPN() {

        vpnRunning.negate()
        button.title = "Stop VPN"
        do {
            try manager.connection.startVPNTunnel()
        }
        catch {
            print("error")
        }
//        manager.loadFromPreferences { (Error) in
//            print(Error)
//        }
    }
    
    func stopVPN() {
        print("Stopping")
        vpnRunning.negate()
        button.title = "Start VPN"
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if vpnRunning {
            stopVPN()
        }
        else {
            startVPN()
        }
    }
    @IBOutlet weak var button: NSButton!
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

