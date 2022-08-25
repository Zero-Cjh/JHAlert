//
//  JHAlert_MainView_Method.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/19.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import UIKit

extension JHAlertMainView {
    
    /// 显示Alert
    /// 附带动画
    func show() {
        guard let rootView: UIView = JHAlertHeader.rootView else {
            return
        }
        rootView.addSubview(self)
        self.snp.makeConstraints { make in
            make.edges.equalTo(rootView)
        }
        self.centerView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        self.setNeedsLayout()
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
            self.backgroundView.alpha = 1
            self.centerView.alpha = 1
            self.centerView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    /// 移除Alert
    /// 附带动画
    func remove() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut) {
            self.backgroundView.alpha = 0
            self.centerView.alpha = 0
            self.setNeedsLayout()
            self.layoutIfNeeded()
        } completion: { finished in
            self.removeFromSuperview()
        }
    }
    
    /// 设置回调
    func resultBlock(_ block: ((Bool) -> ())?) {
        self.resultBlock = block
    }
    
    /// 按钮数量
    var buttonCount: Int {
        get {
            return self.displayBtnCount
        }
        set {
            self.configBtnCount(newValue)
        }
    }
    
    /// 标题颜色
    var titleColor: UIColor? {
        get {
            return self.titleLabel.textColor
        }
        set {
            self.titleLabel.textColor = newValue
        }
    }
    
    /// 信息颜色
    var msgColor: UIColor? {
        get {
            return self.msgLabel.textColor
        }
        set {
            self.msgLabel.textColor = newValue
        }
    }
    
    /// 取消按钮文字
    var cancelString: String? {
        get {
            return self.cancelBtn.title(for: .normal)
        }
        set {
            self.cancelBtn.setTitle(newValue, for: .normal)
        }
    }
    
    /// 确认按钮文字
    var confirmString: String? {
        get {
            return self.confirmBtn.title(for: .normal)
        }
        set {
            self.confirmBtn.setTitle(newValue, for: .normal)
        }
    }
    
    /// 取消按钮字体颜色
    var cancelColor: UIColor? {
        get {
            return self.cancelBtn.titleColor(for: .normal)
        }
        set {
            self.cancelBtn.setTitleColor(newValue, for: .normal)
        }
    }
    
    /// 确认按钮字体颜色
    var confirmColor: UIColor? {
        get {
            return self.confirmBtn.titleColor(for: .normal)
        }
        set {
            self.confirmBtn.setTitleColor(newValue, for: .normal)
        }
    }
    
    /// 弹窗背景色
    var alertViewColor: UIColor? {
        get {
            return self.centerView.backgroundColor
        }
        set {
            self.centerView.backgroundColor = newValue
        }
    }
    
    /// 遮罩层背景色
    var backgroundViewColor: UIColor? {
        get {
            return self.backgroundView.backgroundColor
        }
        set {
            self.backgroundView.backgroundColor = newValue
        }
    }
    
    /// 标题字体
    var titleFont: UIFont? {
        get {
            return self.titleLabel.font
        }
        set {
            self.titleLabel.font = newValue
        }
    }
    
    /// 信息字体
    var msgFont: UIFont? {
        get {
            return self.msgLabel.font
        }
        set {
            self.msgLabel.font = newValue
        }
    }
    
    /// 标题文字
    var titleString: String? {
        get {
            return self.titleLabel.text
        }
        set {
            self.titleLabel.text = newValue
        }
    }
    
    /// 信息文字
    var msgString: String? {
        get {
            return self.msgLabel.text
        }
        set {
            self.msgLabel.text = newValue
        }
    }
    
}
