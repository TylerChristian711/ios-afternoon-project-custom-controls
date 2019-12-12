//
//  CustomControl.swift
//  CustomeViewStar
//
//  Created by Lambda_School_Loaner_218 on 12/12/19.
//  Copyright © 2019 Lambda_School_Loaner_218. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value:Int = 1
    private let componentCount = 5
    private var components: [UILabel] = []
    private let componentsDemention: CGFloat = 40
    private let selectedStar = UIColor.yellow
    private let unselectedStar = UIColor.gray
    
    var startValueX: CGFloat = 8
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentsDemention
        let componentSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentSpacing
        return CGSize(width: width, height: componentsDemention)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    // Sets up custom control view
    func setup() {
        backgroundColor = .clear
        frame = CGRect(origin: .zero, size: intrinsicContentSize)
        for index in 1 ... componentCount {
            // Create label
            let label = UILabel(frame:CGRect(x: startValueX, y: 0.0, width: componentsDemention, height: componentsDemention))
            startValueX += componentsDemention + 8.0
            label.tag = index
            label.text = "★"
            if index == 1 {
                label.textColor = selectedStar
            } else {
                label.textColor = unselectedStar
            }
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            addSubview(label)
            components.append(label)
            
        }
        
    }
    
    func updateValue(at touch:UITouch) {
        let touchPoint = touch.location(in: self)
        for label in components {
            if label.frame.contains(touchPoint) {
                value = label.tag
                sendActions(for: .valueChanged)
            }
        }
        
        switch value {
        case 1:
            components[0].textColor = selectedStar
            components[1].textColor = unselectedStar
            components[2].textColor = unselectedStar
            components[3].textColor = unselectedStar
            components[4].textColor = unselectedStar
            
        case 2:
            components[0].textColor = selectedStar
            components[1].textColor = selectedStar
            components[2].textColor = unselectedStar
            components[3].textColor = unselectedStar
            components[4].textColor = unselectedStar
            
            
        case 3:
            components[0].textColor = selectedStar
            components[1].textColor = selectedStar
            components[2].textColor = selectedStar
            components[3].textColor = unselectedStar
            components[4].textColor = unselectedStar
            
            
        case 4:
            components[0].textColor = selectedStar
            components[1].textColor = selectedStar
            components[2].textColor = selectedStar
            components[3].textColor = selectedStar
            components[4].textColor = unselectedStar
            
        case 5:
            components[0].textColor = selectedStar
            components[1].textColor = selectedStar
            components[2].textColor = selectedStar
            components[3].textColor = selectedStar
            components[4].textColor = selectedStar
            
        default:
            break
            
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: .touchDown)
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}
