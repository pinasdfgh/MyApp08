//
//  CustomCellViewController.swift
//  MyApp08
//
//  Created by user on 2017/6/22.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class CustomCellViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tbVeiw: UITableView!
    
     private let mydata = ["猜數字Ｖ1","猜數字Ｖ2","切換場景","自訂UIView","簽名板","自訂cell"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return mydata.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tbVeiw.dequeueReusableCell(withIdentifier: "customcell") as! CustomTableViewCell
        cell.img.image = UIImage(named: "Apple.jpg")
//        cell.imginput()
        cell.label1.text = mydata[indexPath.row]
        cell.label2.text = "123457"
        cell.img.layer.cornerRadius = 10
        cell.img.clipsToBounds = true
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()

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
