//
//  JHAlert_Color.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/18.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import UIKit

extension JHAlert {
    
    /// 标题颜色
    ///
    /// Default: black
    public var titleColor: UIColor? {
        get {
            return self.mainView.titleColor
        }
        set {
            self.mainView.titleColor = newValue
        }
    }
    
    /// 信息颜色
    ///
    /// Default: black
    public var msgColor: UIColor? {
        get {
            return self.mainView.msgColor
        }
        set {
            self.mainView.msgColor = newValue
        }
    }
    
    /// 取消按钮字体颜色
    ///
    /// Default: systemBlue
    public var cancelColor: UIColor? {
        get {
            return self.mainView.cancelColor
        }
        set {
            self.mainView.cancelColor = newValue
        }
    }
    
    /// 确认按钮字体颜色
    ///
    /// Default: systemBlue
    public var confirmColor: UIColor? {
        get {
            return self.mainView.confirmColor
        }
        set {
            self.mainView.confirmColor = newValue
        }
    }
    
    /// 弹窗背景色
    ///
    /// Default: white
    public var alertViewColor: UIColor? {
        get {
            return self.mainView.alertViewColor
        }
        set {
            self.mainView.alertViewColor = newValue
        }
    }
    
    /// 遮罩层背景色
    ///
    /// Default: Color(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
    public var backgroundColor: UIColor? {
        get {
            return self.mainView.backgroundViewColor
        }
        set {
            self.mainView.backgroundViewColor = newValue
        }
    }
}
