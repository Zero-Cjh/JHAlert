//
//  JHAlert.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/16.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import UIKit

/// 快捷单例
public let JHAlertManager = JHAlert.Manager

@objc public class JHAlert: NSObject {
    
    // MARK: - Public
    
    /// 单例
    @objc public static let `Manager` = JHAlert.init()
    
    /// 标题颜色
    @objc public var titleColor: UIColor? {
        get {
            return self.mainView.titleColor
        }
        set {
            self.mainView.titleColor = newValue
        }
    }
    
    /// 信息颜色
    @objc public var msgColor: UIColor? {
        get {
            return self.mainView.msgColor
        }
        set {
            self.mainView.msgColor = newValue
        }
    }
    
    /// 取消按钮字体颜色
    @objc public var cancelColor: UIColor? {
        get {
            return self.mainView.cancelColor
        }
        set {
            self.mainView.cancelColor = newValue
        }
    }
    
    /// 确认按钮字体颜色
    @objc public var confirmColor: UIColor? {
        get {
            return self.mainView.confirmColor
        }
        set {
            self.mainView.confirmColor = newValue
        }
    }
    
    /// 弹窗背景色
    @objc public var alertViewColor: UIColor? {
        get {
            return self.mainView.alertViewColor
        }
        set {
            self.mainView.alertViewColor = newValue
        }
    }
    
    /// 遮罩层背景色
    @objc public var backgroundColor: UIColor? {
        get {
            return self.mainView.backgroundViewColor
        }
        set {
            self.mainView.backgroundViewColor = newValue
        }
    }
    
    /// 标题字体
    @objc public var titleFont: UIFont? {
        get {
            return self.mainView.titleFont
        }
        set {
            self.mainView.titleFont = newValue
        }
    }
    
    /// 信息字体
    @objc public var msgFont: UIFont? {
        get {
            return self.mainView.msgFont
        }
        set {
            self.mainView.msgFont = newValue
        }
    }
    
    /// 取消按钮文字
    @objc public var cancelString: String? {
        get {
            return self.normalCancelString
        }
        set {
            self.normalCancelString = newValue
        }
    }
    
    /// 确认按钮文字
    @objc public var confirmString: String? {
        get {
            return self.normalConfirmString
        }
        set {
            self.normalConfirmString = newValue
        }
    }
    
    /// 显示警告弹窗
    /// - Parameters:
    ///   - title: 弹窗标题
    ///   - msg: 弹窗信息
    ///   - buttonCount: 按钮数量，默认显示2个按钮。当数量为0时，点击背景返回。当数量为1时，只显示ConfirmBtn。
    ///   - cancelString: 取消按钮文本
    ///   - confirmString: 确认按钮文本
    ///   - result: 用户选择结果，取消==NO, 确认==YES
    @objc public func show(_ title: String,
                     msg: String? = nil,
                     buttonCount: Int = 2,
                     cancelString: String? = nil,
                     confirmString: String? = nil,
                     result: ((_ result: Bool) -> ())? = nil) {
        self.mainView.titleString = title
        self.mainView.msgString = msg
        self.mainView.buttonCount = buttonCount
        self.mainView.cancelString = cancelString ?? self.cancelString
        self.mainView.confirmString = confirmString ?? self.confirmString
        self.mainView.resultBlock(result)
        self.mainView.show()
    }
    
    // MARK: - Private
    
    /// 默认取消按钮文字
    var normalCancelString: String?
    
    /// 默认确认按钮文字
    var normalConfirmString: String?
    
    /// 弹窗View
    /// 不要直接进行操作
    let mainView: JHAlertMainView = JHAlertMainView()
    
    override init() {
        super.init()
        self.titleColor = JHAlert.titleColor
        self.msgColor = JHAlert.msgColor
        self.cancelColor = JHAlert.cancelColor
        self.confirmColor = JHAlert.confirmColor
        self.titleFont = JHAlert.titleFont
        self.msgFont = JHAlert.msgFont
        self.alertViewColor = JHAlert.alertViewColor
        self.backgroundColor = JHAlert.backgroundColor
        self.cancelString = JHAlert.cancelString
        self.confirmString = JHAlert.confirmString
    }
    
}
