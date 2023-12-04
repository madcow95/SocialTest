//
//  Extension.swift
//  SocialApp
//
//  Created by MadCow on 2023/11/14.
//

import UIKit

// 다른 Controller에서 공통으로 사용할 수 있는 함수를 모아놓은 곳

// size, layout
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false // 자동적으로 resizing 해주는 것
        
        if let top = top {
            // top Anchor의 constraint를 설정한다. equalTo는 top만큼, constant는 paddingTop만큼 되도록 활성화한다.
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    // Image의 Center 값을 설정하는 함수
    func centerY(inView: UIView,
                 leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0,
                 constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false // 자동적으로 resizing 해주는 것
        centerYAnchor.constraint(equalTo: inView.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    // UIView의 X축 위치를 맞추기 위한 함수
    func centerX(inView: UIView,
                 topAnchor: NSLayoutYAxisAnchor? = nil,
                 paddingTop: CGFloat? = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: inView.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    // 직사각형의 width, height를 설정할 수 있는 함수?
    func setDimension(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    // 높이 값을 설정하는 함수
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    // 넓이 값을 설정하는 함수
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    // superView를 적용시키는 함수?
    func fillSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

extension UIButton {
    func setAttributedTitle(firstPart: String, secondPart: String) {
        let attr: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.9), .font: UIFont.systemFont(ofSize: 16)]
        let title = NSMutableAttributedString(string: "\(firstPart)", attributes: attr)
        
        let boldStyle: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.9), .font: UIFont.boldSystemFont(ofSize: 16)]
        title.append(NSAttributedString(string: secondPart, attributes: boldStyle))
        
        setAttributedTitle(title, for: .normal)
    }
}

extension UIViewController {
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
