//
//  painterView.swift
//  MyApp08
//
//  Created by user on 2017/6/23.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class painterView: UIView {
    
    private var viewW:CGFloat = 0
    private var viewh:CGFloat = 0
    private var lines:Array<Array<(CGFloat,CGFloat)>> = [[]]
    private var resycle:Array<Array<(CGFloat,CGFloat)>> = [[]]
    private var isInit = false
    private var context:CGContext?
    
    private func initState(_ rect:CGRect){
        isInit = true
        viewW = rect.size.width
        viewh = rect.size.height
        context = UIGraphicsGetCurrentContext()
    }
    
    
    //呈現外觀
    //有一點draw是整個畫面更新
    override func draw(_ rect: CGRect) {
        
        if !isInit {initState(rect)}
        
        print("\(viewW):\(viewh)")
        
//        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
//        context?.move(to: CGPoint(x: 0, y: 0))
//        context?.addLine(to: CGPoint(x: 100, y: 200))
//        context?.drawPath(using: CGPathDrawingMode.stroke)
//        
//        context?.setLineWidth(2)
//        context?.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
//        context?.move(to: CGPoint(x: 200, y: 200))
//        context?.addLine(to: CGPoint(x: 200, y: 250))
//        context?.addLine(to: CGPoint(x: 250, y: 250))
//        context?.addLine(to: CGPoint(x: 250, y: 200))
//        context?.addLine(to: CGPoint(x: 200, y: 200))
//        context?.drawPath(using: CGPathDrawingMode.stroke)
        
//context?.drawPath 代表一條線若要再做另一條要在產生一個context?.drawPath
//        print(lines.count)
//        if lines.count <= 1 {return}
        
        
//        print(lines[0].description)
//        print(lines[1].description)
        
        var j = 1
        while j < lines.count {
            if lines[j].count <= 1 {continue}
            for i in 1..<lines[j].count{
                var (p0x,p0y) = lines[j][i-1]
                let (pix,piy) = lines[j][i]
                p0x = pix + CGFloat(arc4random()%4)
                p0y = piy + CGFloat(arc4random()%8)
//                print("dpow")
                context?.move(to: CGPoint(x: p0x, y: p0y))
                context?.addLine(to: CGPoint(x: pix, y: piy))
                context?.drawPath(using: CGPathDrawingMode.stroke)
            }
            j += 1
        }
        
        var img = UIImage(named:"Apple.jpg")
        var imgW = img?.size.width
        var imgH = img?.size.height
        var temp = UIImageView(image: img)
        temp.frame = CGRect(x: 0, y: 0, width: imgW!, height: imgH!)
        addSubview(temp)
        
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?){
        let touch:UITouch = touches.first!
        let point:CGPoint = touch.location(in: self)
        lines += [[]]
        lines[lines.count - 1].append((point.x,point.y))
        resycle = [[]]
        print("\(point.x)x\(point.y)")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with: UIEvent?){
       
        let touch:UITouch = touches.first!
        let point:CGPoint = touch.location(in: self)
        lines[lines.count - 1].append((point.x,point.y))
        setNeedsDisplay()
//        print("\(point.x)x\(point.y)")
    }
    
    func clear(){
        lines = [[]]
        resycle = [[]]
        setNeedsDisplay()
    }
    
    func undo(){
        if lines.count > 1{
           resycle += [lines.remove(at:lines.count - 1 )]
            setNeedsDisplay()
        }
    }
    
    func redo(){
        print("out \(resycle.count)")
        if resycle.count > 1{
            print("in \(resycle.count)")
            lines += [resycle.remove(at:resycle.count - 1 )]
            setNeedsDisplay()
        }
    }

    
    
    


}
