//
//  YPGridView.swift
//  YPImgePicker
//
//  Created by Sacha Durand Saint Omer on 15/11/2016.
//  Copyright © 2016 Yummypets. All rights reserved.
//

import Stevia

//vs 显示区域线条
class YPGridView: UIView {
    public var libraryImageratio = YPConfig.library.libraryImageratio
    
    let line1 = UIView()
    let line2 = UIView()
    let line3 = UIView()
    let line4 = UIView()
    let box1 = UIView()
    let box2 = UIView()
    let box3 = UIView()
    let box4 = UIView()
    
    
    convenience init() {
        self.init(frame: .zero)
//        print("gridview init 执行几次？")
        
        isUserInteractionEnabled = false
        sv(
//            line1,
//            line2,
//            line3,
//            line4,
//            box1,
//            box2,
//            box3,
//            box4
        )
//        print(libraryImageratio)
//        let wh = libraryImageratio.split(separator: ":")
//        let arrayStrings: [String] = wh.compactMap { "\($0)" }
//        
//        let scaleWidth = Float(arrayStrings[0]) ?? 1
//        let scaleHeight = Float(arrayStrings[1]) ?? 1
//        //vs 如果宽度小于高y
//        print("scaleWidth - ",scaleWidth, "scaleHeight - ",scaleHeight);
//        let boxcolor = UIColor.black.withAlphaComponent(0.6)
//        if(scaleWidth < scaleHeight){
////            box1.Height = Height
////            let a = Width
//            print("scaleWidth / scaleHeight", 1 - scaleWidth/scaleHeight)
//            
//            let shadeWidth = ((1 - scaleWidth/scaleHeight) / 2) * 100;
//            box1.Width == CGFloat(shadeWidth) % Width
//            box1.Height == 100 % Height
////            let leftval = shadeWidth / 2
//            box1.Left == 10 % Left
//            box1.top(0)
//            box1.backgroundColor = boxcolor
//            
//            box2.Width == CGFloat(shadeWidth) % Width
//            box2.Height == 100 % Height
//            box2.top(0).right(0)
//            box2.backgroundColor = boxcolor
//            
//        }
//        //vs 如果宽度大于高
//        if(scaleWidth > scaleHeight){
//            let shadeWidth = ((1 - scaleHeight/scaleWidth) / 2) * 100;
//            
//            box3.Width == 100 % Width
//            box3.Height == CGFloat(shadeWidth) % Height
//            box3.top(0).left(0)
//            box3.backgroundColor = boxcolor
//            
//            box4.Width == 100 % Width
//            box4.Height == CGFloat(shadeWidth) % Height
//            box4.bottom(0).left(0)
//            box4.backgroundColor = boxcolor
//        }
//        
//        box1.Left == 10 % Left
//        box1.Height == 100 % Height
//        box3.Left == 10 % Left
//        box3.Height == 100 % Height
        
        
        
//        let stroke: CGFloat = 0.5
//        line1.top(0).width(stroke).bottom(0)
//        line1.Right == 33 % Right
//        
//        line2.top(0).width(stroke).bottom(0)
//        line2.Right == 66 % Right
//        
//        line3.left(0).height(stroke).right(0)
//        line3.Bottom == 33 % Bottom
//        
//        line4.left(0).height(stroke).right(0)
//        line4.Bottom == 66 % Bottom
//        
//        let color = UIColor.white.withAlphaComponent(0.6)
//        line1.backgroundColor = color
//        line2.backgroundColor = color
//        line3.backgroundColor = color
//        line4.backgroundColor = color
//        
//        applyShadow(to: line1)
//        applyShadow(to: line2)
//        applyShadow(to: line3)
//        applyShadow(to: line4)
        
        
    }
    
    func applyShadow(to view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
