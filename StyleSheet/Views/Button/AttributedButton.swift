//
//  AttributedButton.swift
//  LTViewStyle
//
//  Created by Mikhail Muzhev on 14/02/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import Foundation
import UIKit

class AttributedButton: UIButton {
    
    lazy private var attributedTitleLabelsDictionary: [UILabel?: UIControl.State] = {
        
        return [normalAttributedTitleLabel: .normal,
                highlitedAttributedTitleLabel: .highlighted,
                disabledAttributedTitleLabel: .disabled,
                selectedAttributedTitleLabel: .selected,
                focusedAttributedTitleLabel: .focused,
                applicationAttributedTitleLabel: .application,
                reservedAttributedTitleLabel: .reserved]
    }()
    
    public var normalAttributedTitleLabel: AttributedLabel? {
        didSet {
            normalAttributedTitleLabel?.delegate = self
        }
    }
    
    public var highlitedAttributedTitleLabel: AttributedLabel? {
        didSet {
            highlitedAttributedTitleLabel?.delegate = self
        }
    }
    
    public var disabledAttributedTitleLabel: AttributedLabel? {
        didSet {
            disabledAttributedTitleLabel?.delegate = self
        }
    }
    
    public var selectedAttributedTitleLabel: AttributedLabel? {
        didSet {
            selectedAttributedTitleLabel?.delegate = self
        }
    }
    
    public var focusedAttributedTitleLabel: AttributedLabel? {
        didSet {
            focusedAttributedTitleLabel?.delegate = self
        }
    }
    
    public var applicationAttributedTitleLabel: AttributedLabel? {
        didSet {
            applicationAttributedTitleLabel?.delegate = self
        }
    }
    
    public var reservedAttributedTitleLabel: AttributedLabel? {
        didSet {
            reservedAttributedTitleLabel?.delegate = self
        }
    }
    
    public var style: Style<AttributedButton> = DefaultStyle.button {
        didSet {
            normalAttributedTitleLabel?.attributedText = NSAttributedString(string: title(for: .normal) ?? "")
            highlitedAttributedTitleLabel?.attributedText = NSAttributedString(string: title(for: .highlighted) ?? "")
            disabledAttributedTitleLabel?.attributedText = NSAttributedString(string: title(for: .disabled) ?? "")
            selectedAttributedTitleLabel?.attributedText = NSAttributedString(string: title(for: .selected) ?? "")
            focusedAttributedTitleLabel?.attributedText = NSAttributedString(string: title(for: .focused) ?? "")
            applicationAttributedTitleLabel?.attributedText = NSAttributedString(string: title(for: .application) ?? "")
            reservedAttributedTitleLabel?.attributedText = NSAttributedString(string: title(for: .reserved) ?? "")
            apply(style)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        normalAttributedTitleLabel = AttributedLabel(style: DefaultStyle.label)
        highlitedAttributedTitleLabel = AttributedLabel(style: DefaultStyle.label)
        disabledAttributedTitleLabel = AttributedLabel(style: DefaultStyle.label)
        selectedAttributedTitleLabel = AttributedLabel(style: DefaultStyle.label)
        focusedAttributedTitleLabel = AttributedLabel(style: DefaultStyle.label)
        applicationAttributedTitleLabel = AttributedLabel(style: DefaultStyle.label)
        reservedAttributedTitleLabel = AttributedLabel(style: DefaultStyle.label)
    }
    
}

extension AttributedButton: AttributedLabelDelegate {
    
    func styleChanged(for label: AttributedLabel) {
        guard let state = attributedTitleLabelsDictionary[label] else { return }
        setAttributedTitle(label.attributedText, for: state)
    }
    
}
