//
//  ViewController.swift
//  MyApp08
//
//  Created by user on 2017/6/22.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

//在拉現實拉到UITableViewDelegate,UITableViewDataSource的prorocol
//UITableViewDelegate=>事件   UITableViewDataSource＝>存放資料
//note:UITableViewDataSource有兩個不是option的func
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBAction func backHere(segue:UIStoryboardSegue){
        print("back")
    }
    
    @IBOutlet weak var tbView: UITableView!
    
    private let mydata = ["猜數字Ｖ1","猜數字Ｖ2","切換場景","自訂UIView","簽名板","自訂cell","touch event"]
    
//取得cell數量
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return mydata.count
    }
    
//輸入cell資訊
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tbView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = mydata[indexPath.row]
        return cell!
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        gotoVC(whereVc:indexPath.row)
    }
    
    private func gotoVC(whereVc:Int){
        switch whereVc {
        case 2:
            if let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2"){
                show(vc2,sender:self)
            }
        case 4:
            if let paintervc = storyboard?.instantiateViewController(withIdentifier: "paintervc"){
                show(paintervc,sender:self)
            }
            
        case 5:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "CustomCellvc"){
                show(vc ,sender:self)
            }
            break
        case 6:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "touchVC"){
                show(vc ,sender:self)
            }
            break
        default:
            break
        }
        
    }

}

