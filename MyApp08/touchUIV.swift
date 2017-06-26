//
//  touchUIV.swift
//  MyApp08
//
//  Created by user on 2017/6/26.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class touchUIV: UIView {
    var initStat = false
    private var ttvc:touchVC?
    
    private func initState(){
        initStat = true
        
        let vc = findSuperVC(whichView: self)
        ttvc = vc as! touchVC
        print(ttvc!.a)
        //抓父容器的方法2
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        ttvc = storyboard.instantiateViewController(withIdentifier: "touchVC") as! touchVC
        
        print(ttvc!.b)
        
    }
    //find Super Container
    private func findSuperVC(whichView:UIView)->UIViewController?{
        //抓父容器的方法1
        var responder:UIResponder = whichView
        while responder != nil{
            print("ok")
            if let vc = responder as? UIViewController{
                return vc
            }
            responder = responder.next!
        }
        return nil
    }
    
    override func draw(_ rect: CGRect) {
        if !initStat {initState()}
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        ttvc?.touchesBegan(touches, with: event)
        print("MyView:touchBengin")
//        super.touchesBegan(touches, with: event)
        
    }

}
