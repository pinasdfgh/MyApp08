//
//  Vc2ViewController.swift
//  MyApp08
//
//  Created by user on 2017/6/23.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class Vc2ViewController: UIViewController {
    
    @IBOutlet weak var labelApp: UILabel!
    @IBOutlet weak var lbRand: UILabel!
    
    private let rand = Int(arc4random_uniform(49))
    
    //Note只要切換就會去除舊的物件產生新的物件所以變數無法儲存,儲存方法有二 
    //1.每次切換就傳遞參數到新的頁面
    //2.用AppDelegate儲存再取出
    @IBAction func govc3(_ sender: Any) {
        if let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3"){
            show(vc3 , sender: self)
        }
    }
    
    @IBAction func govc4(_ sender: Any) {
        if let vc4 = storyboard?.instantiateViewController(withIdentifier: "vc4"){
            show(vc4,sender: self)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("vc2:viewDidLoad()")
        lbRand.text = String(rand)
        //AppDelegate可以儲存全局變數
        let app = UIApplication.shared.delegate as! AppDelegate
        labelApp.text = String(app.rand)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
