//
//  touchVC.swift
//  MyApp08
//
//  Created by user on 2017/6/26.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class touchVC: UIViewController {
    
    var a = 1234
    var b = 4321

    
    @IBOutlet weak var myView: touchUIV!
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 0.6)
        //tap  單點
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTest))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 2
        myView.addGestureRecognizer(tapGesture)
        //touch後距離拉大或縮小
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchTest(_:)))
//        myView.addGestureRecognizer(pinchGesture)
        //兩點touch旋轉
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation(_:)))
//        myView.addGestureRecognizer(rotationGesture)
        //touch 後移動
        let swipeRGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeTest(_:)))
        //direction無法多個 so 需要多個宣告
        swipeRGesture.direction = UISwipeGestureRecognizerDirection.right
        swipeRGesture.numberOfTouchesRequired = 1
        myView.addGestureRecognizer(swipeRGesture)
        
        let swipeLGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeTest(_:)))
        //direction無法多個 so 需要多個宣告
        swipeLGesture.direction = UISwipeGestureRecognizerDirection.left
        swipeLGesture.numberOfTouchesRequired = 1
        myView.addGestureRecognizer(swipeLGesture)
        
    }
    @objc private func tapTest(_ sender:UITapGestureRecognizer){
        print("two finger touch")
        let point0 = sender.location(ofTouch: 0, in: sender.view)
        print("0.\(point0)")
        let point1 = sender.location(ofTouch: 0, in: sender.view)
        print("1.\(point1)")
    }
    @objc private func pinchTest(_ sender:UIPinchGestureRecognizer){
        if sender.state == UIGestureRecognizerState.changed{
            print(sender.scale) // > 1放大 < 1 縮小
        }
    }
    
    @objc private func rotation(_ sender:UIRotationGestureRecognizer){
        print(sender.rotation)
        let rad = sender.rotation
        var deg = (rad * 180.0 / CGFloat(M_PI))
        if deg > 0{
            print("順：\(deg)")
        }else{
            print("逆：\(deg)")
        }
    }
    
    @objc func swipeTest(_ sender:UISwipeGestureRecognizer){
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("1")
            break
        case UISwipeGestureRecognizerDirection.left:
            print("2")
            break
        case UISwipeGestureRecognizerDirection.up:
            print("3")
            break
        case UISwipeGestureRecognizerDirection.down:
            print("4")
            break
        default:
            break
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("VC touch")
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
