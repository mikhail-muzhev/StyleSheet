//
//  View+Style.swift
//  LTViewStyle
//
//  Created by Pavel Razuvaev on 08/02/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public convenience init<V>(style: Style<V>) {
        self.init(frame: .zero)
        apply(style)
    }
    
    public func apply<V>(_ style: Style<V>) {
        guard let view = self as? V else {
            print("💥 Could not apply style for \(V.self) to \(type(of: self))")
            return
        }
        style.apply(to: view)
    }

}
