//
//  YPLibraryView.swift
//  YPImgePicker
//
//  Created by Sacha Durand Saint Omer on 2015/11/14.
//  Copyright © 2015 Yummypets. All rights reserved.
//

import UIKit
import Stevia
import Photos

final class YPLibraryView: UIView {
    
    let assetZoomableViewMinimalVisibleHeight: CGFloat  = 50
    
    
    
    @IBOutlet weak var allview: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var assetZoomableView: YPAssetZoomableView!
    @IBOutlet weak var assetViewContainer: YPAssetViewContainer!
    @IBOutlet weak var assetViewContainerConstraintTop: NSLayoutConstraint!
    
    public var libraryImageratio = YPConfig.library.libraryImageratio
    
    let maxNumberWarningView = UIView()
    let maxNumberWarningLabel = UILabel()
    let progressView = UIProgressView()
    let line = UIView()
    
    let screenWidth : CGFloat = UIScreen.main.bounds.size.width
    let screenHeight : CGFloat = UIScreen.main.bounds.size.height
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sv(
            line
        )
        print(frame)
        layout(
            assetViewContainer,
            |line| ~ 1
        )
        
        self.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: screenWidth,
            height: screenHeight)
        self.allview.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: screenWidth,
            height: screenHeight)
        
        print(self.frame.size.height,"--------------")
        
        //        let viewBounds:CGRect = CGRectMake(0,20,
        //                                           UIScreen.mainScreen().bounds.width,
        //                                           UIScreen.mainScreen().bounds.height-20)
        //        println(viewBounds) //iPhone6输出：（0.0,20.0,375.0,647.0）
        
        
        //        assetViewContainer.backgroundColor = .red
        
        
        
        let wh = libraryImageratio.split(separator: ":")
        let arrayStrings: [String] = wh.compactMap { "\($0)" }
        
        let scaleWidth = Float(arrayStrings[0]) ?? 1
        let scaleHeight = Float(arrayStrings[1]) ?? 1
        
        print("scaleWidth / scaleHeight", scaleWidth/scaleHeight)
        let scale: CGFloat = CGFloat(scaleWidth)/CGFloat(scaleHeight)
        var assetZoomableViewFrame = CGRect(
            x: 0.0,
            y: 0.0,
            width: screenWidth,
            height: screenHeight)
        
        if(scale < 1){
            let wh = screenWidth * scale
            print((screenWidth - wh) / 2)
            print("(screenWidth - wh) / 2", (screenWidth - wh) / 2, "-- wh --", wh)
            assetZoomableViewFrame = CGRect(
                x: (screenWidth - wh) / 2,
                y: 0.0,
                width: wh,
                height: screenWidth)
            
            
            
        }
        if(scale > 1){
            let wh = screenWidth / scale
            print("(screenWidth - wh) / 2", (screenWidth - wh) / 2, "-- wh --", wh)
            assetZoomableViewFrame = CGRect(
                x: 0.0,
                y: (screenWidth - wh) / 2,
                width: screenWidth,
                height: wh)
            
            
            
        }
        
        let widthb:NSLayoutConstraint = NSLayoutConstraint(item: self.assetViewContainer!, attribute:  NSLayoutConstraint.Attribute.width, relatedBy:NSLayoutConstraint.Relation.equal, toItem:nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier:0.0, constant:screenWidth)
        self.assetViewContainer.addConstraint(widthb)
        
        let heightb:NSLayoutConstraint = NSLayoutConstraint(item: self.assetViewContainer!, attribute:  NSLayoutConstraint.Attribute.height, relatedBy:NSLayoutConstraint.Relation.equal, toItem:nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier:0.0, constant:screenWidth)
        self.assetViewContainer.addConstraint(heightb)
        
        assetZoomableView.frame =  assetZoomableViewFrame
        
        
        print(UIScreen.main.bounds.size.width,"--------------")
        
//        self.frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight)
        //        allview.frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight)
        
        assetViewContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        collectionView.frame =  CGRect(x: 0.0, y: screenWidth, width: screenWidth, height: screenHeight - screenWidth)
        print(collectionView.frame , screenWidth, screenHeight)
        if #available(iOS 11.0, *) {
            let insets = UIApplication.shared.delegate?.window??.safeAreaInsets ?? UIEdgeInsets.zero
            
            let jxheight = screenHeight - screenWidth - assetZoomableViewMinimalVisibleHeight - insets.top - insets.bottom
            collectionView.frame =  CGRect(x: 0.0, y: screenWidth, width: screenWidth, height: jxheight)
        }

        
//        line.backgroundColor = .
        setupMaxNumberOfItemsView()
        setupProgressBarView()
    }
    
    
    /// At the bottom there is a view that is visible when selected a limit of items with multiple selection
    func setupMaxNumberOfItemsView() {
        // View Hierarchy
        sv(
            maxNumberWarningView.sv(
                maxNumberWarningLabel
            )
        )
        
        // Layout
        |maxNumberWarningView|.bottom(0)
        if #available(iOS 11.0, *) {
            maxNumberWarningView.Top == safeAreaLayoutGuide.Bottom - 40
            maxNumberWarningLabel.centerHorizontally().top(11)
        } else {
            maxNumberWarningView.height(40)
            maxNumberWarningLabel.centerInContainer()
        }
        
        // Style
        //vs 底部提示栏
        maxNumberWarningView.backgroundColor = UIColor(r: 246, g: 248, b: 248)
        maxNumberWarningLabel.font = UIFont(name: "Helvetica Neue", size: 14)
        maxNumberWarningView.isHidden = true
    }
    
    /// When video is processing this bar appears
    func setupProgressBarView() {
        sv(
            progressView
        )
        
        progressView.height(5)
        progressView.Top == line.Top
        progressView.Width == line.Width
        progressView.progressViewStyle = .bar
        progressView.trackTintColor = YPConfig.colors.progressBarTrackColor
        progressView.progressTintColor = YPConfig.colors.progressBarCompletedColor ?? YPConfig.colors.tintColor
        progressView.isHidden = true
        progressView.isUserInteractionEnabled = false
    }
}

// MARK: - UI Helpers

extension YPLibraryView {
    
    class func xibView() -> YPLibraryView? {
        let bundle = Bundle(for: YPPickerVC.self)
        let nib = UINib(nibName: "YPLibraryView",
                        bundle: bundle)
        let xibView = nib.instantiate(withOwner: self, options: nil)[0] as? YPLibraryView
        return xibView
    }
    
    // MARK: - Grid
    
    func hideGrid() {
        //        assetViewContainer.grid.alpha = 0
    }
    
    // MARK: - Loader and progress
    
    func fadeInLoader() {
        UIView.animate(withDuration: 0.2) {
            self.assetViewContainer.spinnerView.alpha = 1
        }
    }
    
    func hideLoader() {
        assetViewContainer.spinnerView.alpha = 0
    }
    
    func updateProgress(_ progress: Float) {
        progressView.isHidden = progress > 0.99 || progress == 0
        progressView.progress = progress
        UIView.animate(withDuration: 0.1, animations: progressView.layoutIfNeeded)
    }
    
    // MARK: - Crop Rect
    //当前选中图片的xy和宽高？
    func currentCropRect() -> CGRect {
        guard let cropView = assetZoomableView else {
            return CGRect.zero
        }
        let normalizedX = min(1, cropView.contentOffset.x &/ cropView.contentSize.width)
        let normalizedY = min(1, cropView.contentOffset.y &/ cropView.contentSize.height)
        let normalizedWidth = min(1, cropView.frame.width / cropView.contentSize.width)
        let normalizedHeight = min(1, cropView.frame.height / cropView.contentSize.height)
        print("currentCropRect",normalizedX,normalizedY,normalizedWidth,normalizedHeight)
        return CGRect(x: normalizedX, y: normalizedY, width: normalizedWidth, height: normalizedHeight)
        //        return CGRect(x: normalizedX, y: normalizedY, width: normalizedWidth, height: 100)
    }
    
    // MARK: - Curtain
    
    func refreshImageCurtainAlpha() {
        let imageCurtainAlpha = abs(assetViewContainerConstraintTop.constant)
            / (assetViewContainer.frame.height - assetZoomableViewMinimalVisibleHeight)
        assetViewContainer.curtain.alpha = imageCurtainAlpha
        
        
    }
    
    func cellSize() -> CGSize {
        let size = UIScreen.main.bounds.width/4 * UIScreen.main.scale
        //        print("干什么的？" , size)
        return CGSize(width: size, height: size)
    }
}


extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
