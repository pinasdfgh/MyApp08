//
//  paintervc.swift
//  MyApp08
//
//  Created by user on 2017/6/23.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class paintervc: UIViewController {
    
    
    @IBOutlet weak var painter: painterView!
    
    @IBAction func btnCkear(_ sender: Any) {
        painter.clear()
    }
    
    
    @IBAction func btnUndo(_ sender: Any) {
        painter.undo()
    }
    
    @IBAction func btnRedo(_ sender: Any) {
        painter.redo()
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
