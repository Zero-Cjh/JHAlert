//
//  JHAlertMainView.swift
//  JHAlert
//
//  Created by Junhong on 2022/8/16.
//  Copyright © 2022 JHAlert. All rights reserved.
//

import UIKit
import SnapKit

class JHAlertMainView: UIView {
    
    @objc func didClick(_ button: UIButton) {
        if let resultBlock = resultBlock {
            resultBlock(button.isEqual(self.confirmBtn) ? true : false)
        }
        self.didTouchCancelBtn(button)
        self.remove()
    }
    
    @objc func didTouchDownBtn(_ button: UIButton) {
        if button.isSelected == true {
            return
        }
        button.isSelected = true
        button.backgroundColor = .init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1)
        self.impactLight.impactOccurred()
    }
    
    @objc func didTouchCancelBtn(_ button: UIButton) {
        button.backgroundColor = .clear
        button.isSelected = false
    }
    
    @objc func panAction(_ pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            if self.isInCancelBtn(pan.location(in: self.cancelBtn)) {
                self.didTouchDownBtn(self.cancelBtn)
            } else if self.isInConfirmBtn(pan.location(in: self.confirmBtn)) {
                self.didTouchDownBtn(self.confirmBtn)
            }
            break
        case .changed:
            if self.isInCancelBtn(pan.location(in: self.cancelBtn)) {
                self.didTouchDownBtn(self.cancelBtn)
                self.didTouchCancelBtn(self.confirmBtn)
            } else if self.isInConfirmBtn(pan.location(in: self.confirmBtn)) {
                self.didTouchDownBtn(self.confirmBtn)
                self.didTouchCancelBtn(self.cancelBtn)
            } else {
                self.didTouchCancelBtn(self.cancelBtn)
                self.didTouchCancelBtn(self.confirmBtn)
            }
            break
        case .ended:
            if self.isInCancelBtn(pan.location(in: self.cancelBtn)) {
                self.didClick(self.cancelBtn)
            } else if self.isInConfirmBtn(pan.location(in: self.confirmBtn)) {
                self.didClick(self.confirmBtn)
            } else {
                self.didTouchCancelBtn(self.cancelBtn)
                self.didTouchCancelBtn(self.confirmBtn)
            }
            break
        default:
            break
        }
    }
    
    func isInCancelBtn(_ point: CGPoint) -> Bool {
        if (point.x > 0 &&
            point.x < self.cancelBtn.bounds.width &&
            point.y > 0 &&
            point.y < self.cancelBtn.bounds.height) {
            return true
        } else {
            return false
        }
    }
    func isInConfirmBtn(_ point: CGPoint) -> Bool {
        if (point.x > 0 &&
            point.x < self.confirmBtn.bounds.width &&
            point.y > 0 &&
            point.y < self.confirmBtn.bounds.height) {
            return true
        } else {
            return false
        }
    }
    
    @objc func didClickBackground(_ button: UIButton) {
        print("didClickAlertBackground")
        if self.displayBtnCount == 0 {
            if let resultBlock = self.resultBlock {
                resultBlock(true)
            }
            self.impactLight.impactOccurred()
            self.remove()
        }
    }
    
    // MARK: - UI
    
    func configUI() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didClickBackground(_:)))
        self.backgroundView.addGestureRecognizer(tap)
        self.backgroundView.isUserInteractionEnabled = true
        
        self.addSubview(self.backgroundView)
        self.addSubview(self.centerView)
        self.centerView.addSubview(self.blurEffect)
        self.centerView.addSubview(self.titleLabel)
        self.centerView.addSubview(self.msgLabel)
        self.centerView.addSubview(self.cancelBtn)
        self.centerView.addSubview(self.confirmBtn)
        self.centerView.addSubview(self.landLine)
        self.centerView.addSubview(self.portraitLine)
        
        self.backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        self.centerView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.width.equalTo(270)
        }
        self.blurEffect.snp.makeConstraints { make in
            make.edges.equalTo(self.centerView)
        }
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.centerView).offset(20)
            make.centerX.equalTo(self.centerView)
            make.left.equalTo(self.centerView).offset(15)
            make.right.equalTo(self.centerView).offset(-15)
        }
        self.msgLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            make.centerX.equalTo(self.titleLabel)
            make.width.equalTo(self.titleLabel)
        }
        self.confirmBtn.snp.makeConstraints { make in
            make.top.equalTo(self.msgLabel.snp.bottom).offset(25)
            make.left.equalTo(self.centerView.snp.centerX)
            make.right.equalTo(self.centerView)
            make.height.equalTo(45)
            make.bottom.equalTo(self.centerView)
        }
        self.cancelBtn.snp.makeConstraints { make in
            make.top.equalTo(self.confirmBtn)
            make.left.equalTo(self.centerView)
            make.right.equalTo(self.centerView.snp.centerX)
            make.height.equalTo(self.confirmBtn)
        }
        self.landLine.snp.makeConstraints { make in
            make.top.equalTo(self.confirmBtn)
            make.left.equalTo(self.centerView)
            make.right.equalTo(self.centerView)
            make.height.equalTo(0.5)
        }
        self.portraitLine.snp.makeConstraints { make in
            make.top.equalTo(self.confirmBtn)
            make.left.equalTo(self.confirmBtn)
            make.bottom.equalTo(self.confirmBtn)
            make.width.equalTo(0.5)
        }
    }
    
    func configBtnCount(_ count: Int) {
        self.displayBtnCount = count
        switch count {
        case 0:
            self.confirmBtn.isHidden = true
            self.cancelBtn.isHidden = true
            self.msgLabel.snp.remakeConstraints { make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
                make.centerX.equalTo(self.titleLabel)
                make.width.equalTo(self.titleLabel)
                make.bottom.equalTo(self.centerView).offset(-10)
            }
            self.confirmBtn.snp.remakeConstraints { make in
                make.top.equalTo(self.msgLabel.snp.bottom).offset(25)
                make.left.equalTo(self.centerView)
                make.right.equalTo(self.centerView)
                make.height.equalTo(45)
            }
            break
        case 1:
            self.confirmBtn.isHidden = false
            self.cancelBtn.isHidden = true
            self.msgLabel.snp.remakeConstraints { make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
                make.centerX.equalTo(self.titleLabel)
                make.width.equalTo(self.titleLabel)
            }
            self.confirmBtn.snp.remakeConstraints { make in
                make.top.equalTo(self.msgLabel.snp.bottom).offset(25)
                make.left.equalTo(self.centerView)
                make.right.equalTo(self.centerView)
                make.height.equalTo(45)
                make.bottom.equalTo(self.centerView)
            }
            break
        case 2:
            self.confirmBtn.isHidden = false
            self.cancelBtn.isHidden = false
            self.msgLabel.snp.remakeConstraints { make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
                make.centerX.equalTo(self.titleLabel)
                make.width.equalTo(self.titleLabel)
            }
            self.confirmBtn.snp.remakeConstraints { make in
                make.top.equalTo(self.msgLabel.snp.bottom).offset(25)
                make.right.equalTo(self.centerView)
                make.left.equalTo(self.centerView.snp.centerX)
                make.height.equalTo(45)
                make.bottom.equalTo(self.centerView)
            }
        default:
            break
        }
    }
    
    // MARK: - Property
    
    /// 用户选择回调
    /// true or false
    var resultBlock: ((Bool) -> ())?
    
    var displayBtnCount: Int = 2
    
    lazy var backgroundView: UIView = {
        backgroundView = UIView()
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    lazy var centerView: UIView = {
        centerView = UIView()
        centerView.layer.cornerRadius = 10
        centerView.clipsToBounds = true
        centerView.alpha = 0
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didClickBackground(_:)))
        centerView.isUserInteractionEnabled = true
        centerView.addGestureRecognizer(tap)
        return centerView
    }()
    
    lazy var blurEffect: UIVisualEffectView = {
        blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialLight))
        return blurEffect
    }()
    
    lazy var titleLabel: UILabel = {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    lazy var msgLabel: UILabel = {
        msgLabel = UILabel()
        msgLabel.numberOfLines = 0
        msgLabel.textAlignment = .center
        msgLabel.textColor = .black
        return msgLabel
    }()
    
    lazy var cancelBtn: UIButton = {
        cancelBtn = UIButton()
        cancelBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        cancelBtn.addTarget(self, action: #selector(didClick), for: .touchUpInside)
        cancelBtn.addTarget(self, action: #selector(didTouchDownBtn(_:)), for: .touchDown)
        let pan: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
        pan.minimumNumberOfTouches = 1
        pan.maximumNumberOfTouches = 1
        cancelBtn.addGestureRecognizer(pan)
        return cancelBtn
    }()
    
    lazy var confirmBtn: UIButton = {
        confirmBtn = UIButton()
        confirmBtn.addTarget(self, action: #selector(didClick), for: .touchUpInside)
        confirmBtn.addTarget(self, action: #selector(didTouchDownBtn(_:)), for: .touchDown)
        let pan: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
        pan.minimumNumberOfTouches = 1
        pan.maximumNumberOfTouches = 1
        confirmBtn.addGestureRecognizer(pan)
        return confirmBtn
    }()
    
    lazy var landLine: UIView = {
        landLine = UIView()
        landLine.backgroundColor = .init(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.3)
        return landLine
    }()
    
    lazy var portraitLine: UIView = {
        portraitLine = UIView()
        portraitLine.backgroundColor = .init(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.3)
        return portraitLine
    }()
    
    let impactLight = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Init
    init() {
        super.init(frame: CGRect())
        self.configUI()
    }
    func dealloc() {
        print("dealloc success")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
