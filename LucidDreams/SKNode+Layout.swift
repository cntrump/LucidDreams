/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    Uses retroactive modeling to make `SKNode` a `Layout`.
*/

import UIKit
import SpriteKit

extension SKNode: Layout {
    typealias Content = SKNode

    func layout(in rect: CGRect) {
        // `SKNode` has a flipped coordinate system, so invert our Y coordinates.
        let height = parent?.frame.size.height ?? 0
        position = CGPoint(x: rect.midX, y: height - rect.midY)

        /*
            `SKSpriteNode`s have a settable size, so we'll update the node's size
            in addition to it's `position` (which is done in `SKNode`'s `layout(in:)`
            method).
        */
        if let self = self as? SKSpriteNode {
            self.size = rect.size
        }
    }

    var contents: [Content] {
        return [self]
    }
}
