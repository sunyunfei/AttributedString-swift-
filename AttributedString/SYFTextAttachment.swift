//
//  SYFTextAttachment.swift
//  AttributedString
//
//  Created by 孙云 on 15/12/31.
//  Copyright © 2015年 haidai. All rights reserved.
//

import UIKit

class SYFTextAttachment: NSTextAttachment {
    
    override func attachmentBoundsForTextContainer(textContainer: NSTextContainer?, proposedLineFragment lineFrag: CGRect, glyphPosition position: CGPoint, characterIndex charIndex: Int) -> CGRect {
        return CGRectMake(0,0, lineFrag.size.height, lineFrag.size.height)
    }
}
