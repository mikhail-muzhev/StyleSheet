//
//  Style.swift
//  LTViewStyle
//
//  Created by Pavel Razuvaev on 08/02/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import Foundation
import UIKit

public struct Style<View: UIView> {
    
    public let style: (View) -> Void
    
    public init(_ style: @escaping (View) -> Void) {
        self.style = style
    }
    
    public func apply(to view: View) {
        style(view)
    }

}

enum DefaultStyle {

    static let label = Style<AttributedLabel> {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .red
    }

    static let button = Style<AttributedButton> {
        $0.normalAttributedTitleLabel?.textColor = .yellow
        $0.selectedAttributedTitleLabel?.textColor = .green
        $0.highlitedAttributedTitleLabel?.textColor = .black
    }
}
