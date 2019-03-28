//
//  AttributedLabel.swift
//  LTViewStyle
//
//  Created by Mikhail Muzhev on 08/02/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit

public protocol AttributedLabelDelegate: class {

    func styleChanged(for label: AttributedLabel)

}

public class AttributedLabel: UILabel {

    public weak var delegate: AttributedLabelDelegate?
    
    public var style: Style<AttributedLabel> = DefaultStyle.label {
        didSet {
            attributedText = NSAttributedString(string: text ?? "")
            apply(style)
        }
    }

    // MARK: - Lifecycle

    public convenience init(text: String, style: Style<AttributedLabel>) {
        self.init()
        configureDefault()
        self.style = style
    }
    
    private func configureDefault() {
        numberOfLines = 0
    }

    // MARK: - Attributes

    public override var font: UIFont! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .font, to: font)
            delegate?.styleChanged(for: self)
        }
    }

    public override var textColor: UIColor! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .foregroundColor, to: textColor)
            delegate?.styleChanged(for: self)
        }
    }

    public var textBackgroundColor: UIColor! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .backgroundColor, to: textBackgroundColor)
            delegate?.styleChanged(for: self)
        }
    }

    public var ligature: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .ligature, to: ligature)
            delegate?.styleChanged(for: self)
        }
    }

    public var kern: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .kern, to: kern)
            delegate?.styleChanged(for: self)
        }
    }

    public var strikethroughStyle: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .strikethroughStyle, to: strikethroughStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var underlineStyle: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .underlineStyle, to: underlineStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var strokeColor: UIColor! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .strokeColor, to: strokeColor)
            delegate?.styleChanged(for: self)
        }
    }

    public var strokeWidth: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .strokeWidth, to: strokeWidth)
            delegate?.styleChanged(for: self)
        }
    }

    public var shadow: NSShadow! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .shadow, to: shadow)
            delegate?.styleChanged(for: self)
        }
    }

    public var textEffect: String! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let textEffect = NSString(string: self.textEffect)
            self.attributedText = attributedText.newAttribute(for: .textEffect, to: textEffect)
            delegate?.styleChanged(for: self)
        }
    }

    public var attachment: NSTextAttachment! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .attachment, to: attachment)
            delegate?.styleChanged(for: self)
        }
    }

    public var link: String! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            guard let url = NSURL(string: link) else { return }
            self.attributedText = attributedText.newAttribute(for: .link, to: url)
            delegate?.styleChanged(for: self)
        }
    }

    public var baselineOffset: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .baselineOffset, to: baselineOffset)
            delegate?.styleChanged(for: self)
        }
    }

    public var underlineColor: UIColor! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .underlineColor, to: underlineColor)
            delegate?.styleChanged(for: self)
        }
    }

    public var strikethroughColor: UIColor! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .strikethroughColor, to: strikethroughColor)
            delegate?.styleChanged(for: self)
        }
    }

    public var obliqueness: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .obliqueness, to: obliqueness)
            delegate?.styleChanged(for: self)
        }
    }

    public var expansion: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .expansion, to: expansion)
            delegate?.styleChanged(for: self)
        }
    }

    public var writingDirection: [NSNumber]! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .writingDirection, to: writingDirection)
            delegate?.styleChanged(for: self)
        }
    }

    public var verticalGlyphForm: Int! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            self.attributedText = attributedText.newAttribute(for: .verticalGlyphForm, to: verticalGlyphForm)
            delegate?.styleChanged(for: self)
        }
    }

    // MARK: - ParagraphStyle attributes

    public var lineHeight: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = lineHeight
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var lineSpacing: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var paragraphSpacing: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.paragraphSpacing = paragraphSpacing
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public override var textAlignment: NSTextAlignment {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.alignment = textAlignment
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var firstLineHeadIndent: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = firstLineHeadIndent
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var headIndent: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.headIndent = headIndent
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var tailIndent: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.tailIndent = tailIndent
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public override var lineBreakMode: NSLineBreakMode {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }
    
    public var baseWritingDirection: NSWritingDirection! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.baseWritingDirection = baseWritingDirection
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var lineHeightMultiple: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = lineHeightMultiple
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var paragraphSpacingBefore: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.paragraphSpacingBefore = paragraphSpacingBefore
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var hyphenationFactor: Float! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.hyphenationFactor = hyphenationFactor
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var tabStops: [NSTextTab]! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.tabStops = tabStops
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public var defaultTabInterval: CGFloat! {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.defaultTabInterval = defaultTabInterval
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

    public override var allowsDefaultTighteningForTruncation: Bool {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let paragraphStyle = attributedText.attribute(for: .paragraphStyle) ?? NSMutableParagraphStyle()
            paragraphStyle.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
            self.attributedText = attributedText.newAttribute(for: .paragraphStyle, to: paragraphStyle)
            delegate?.styleChanged(for: self)
        }
    }

}
