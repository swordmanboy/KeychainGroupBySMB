//
//  MainViewController.swift
//  DMPKeyChain-For-Master_Main_swift
//
//  Created by Apinun Wongintawang on 9/6/17.
//  Copyright © 2017 True. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    @IBOutlet weak var dataTextView: SMBUITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateUI(){
//        DMPKeyChain.generateDeviceId(onComplete: { (isComplete, deviceId) in
//            print(deviceId ?? "not data")
//        })
        TokenKeyChain.shareInstance.initializeWithService(serviceKey: "ServiceKey", valueKey: "KeyData", keychain: "test")
        let token : String! = TokenKeyChain.shareInstance.getStringToken()
        self.dataTextView.text = token
//        if let device_id = DMPKeyChain.sharedInstance().currentDeviceID{
//            DMPKeyChain.initialize(withService: "init", forKey: "test")
//            print("device_id : ",device_id)
//        }else{
//            print("device_id : ","not found")
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onGetData(_ sender: Any) {
        let token : String! = TokenKeyChain.shareInstance.getStringToken()
        self.dataTextView.text = token
    }
    
    @IBAction func onSetData(_ sender: Any) {
        if let token = self.dataTextView.text{
            TokenKeyChain.shareInstance.saveStringToken(token: token)
        }
    }
}
