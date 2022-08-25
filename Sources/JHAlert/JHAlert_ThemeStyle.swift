//
//  JHAlert_ThemeStyle.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/25.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import Foundation
import UIKit

@objc public extension JHAlert {
    
    /// 全局标题颜色
    ///
    /// Default: .black
    static var titleColor: UIColor {
        get {
            return JHAlert_TitleColor
        }
        set {
            JHAlert_TitleColor = newValue
            JHAlertManager.titleColor = newValue
        }
    }
    
    /// 全局信息颜色
    ///
    /// Default: .black
    static var msgColor: UIColor {
        get {
            return JHAlert_MsgColor
        }
        set {
            JHAlert_MsgColor = newValue
            JHAlertManager.msgColor = newValue
        }
    }
    
    /// 全局取消按钮颜色
    ///
    /// Default: .systemBlue
    static var cancelColor: UIColor {
        get {
            return JHAlert_CancelColor
        }
        set {
            JHAlert_CancelColor = newValue
            JHAlertManager.cancelColor = newValue
        }
    }
    
    /// 全局确认按钮颜色
    ///
    /// Default: .systemBlue
    static var confirmColor: UIColor {
        get {
            return JHAlert_ConfirmColor
        }
        set {
            JHAlert_ConfirmColor = newValue
            JHAlertManager.confirmColor = newValue
        }
    }
    
    /// 全局标题字体
    ///
    /// Default:
    ///     size: 19
    ///     weight: .medium
    static var titleFont: UIFont {
        get {
            return JHAlert_TitleFont
        }
        set {
            JHAlert_TitleFont = newValue
            JHAlertManager.titleFont = newValue
        }
    }
    
    /// 全局信息字体
    ///
    /// Default:
    ///     size: 15
    ///     weight: .regular
    static var msgFont: UIFont {
        get {
            return JHAlert_MsgFont
        }
        set {
            JHAlert_MsgFont = newValue
            JHAlertManager.msgFont = newValue
        }
    }
    
    /// 全局弹窗颜色
    ///
    /// Default: .white
    static var alertViewColor: UIColor {
        get {
            return JHAlert_AlertViewColor
        }
        set {
            JHAlert_AlertViewColor = newValue
            JHAlertManager.alertViewColor = newValue
        }
    }
    
    /// 全局弹窗遮罩层颜色
    ///
    /// Default:
    ///     red: 0.7
    ///     green: 0.7
    ///     blue: 0.7
    ///     alpha: 0.7
    static var backgroundColor: UIColor {
        get {
            return JHAlert_BackgroundColor
        }
        set {
            JHAlert_BackgroundColor = newValue
            JHAlertManager.backgroundColor = newValue
        }
    }
    
    /// 全局取消按钮文字
    ///
    /// Default: "取消“
    static var cancelString: String {
        get {
            return JHAlert_CancelString
        }
        set {
            JHAlert_CancelString = newValue
            JHAlertManager.cancelString = newValue
        }
    }
    
    /// 全局确认按钮文字
    ///
    /// Default: "确定“
    static var confirmString: String {
        get {
            return JHAlert_ConfirmString
        }
        set {
            JHAlert_ConfirmString = newValue
            JHAlertManager.confirmString = newValue
        }
    }
}

private var JHAlert_TitleColor: UIColor = .black
private var JHAlert_MsgColor: UIColor = .black
private var JHAlert_CancelColor: UIColor = .systemBlue
private var JHAlert_ConfirmColor: UIColor = .systemBlue
private var JHAlert_TitleFont: UIFont = .systemFont(ofSize: 19, weight: .medium)
private var JHAlert_MsgFont: UIFont = .systemFont(ofSize: 15, weight: .regular)
private var JHAlert_AlertViewColor: UIColor = .white
private var JHAlert_BackgroundColor: UIColor = .init(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
private var JHAlert_CancelString: String = "取消"
private var JHAlert_ConfirmString: String = "确定"
