//
//  ConvertToEmoji.playground
//
//  Derived from Tim Ekl's "EmojiFlags"
//  https://www.timekl.com/blog/2017/08/31/swift-tricks-emoji-flags/
//
//  Created by Neil Hiddink on 3/27/20.
//  Copyright © 2020 Neil Hiddink. All rights reserved.
//

import UIKit

func convertToEmoji(str: String) -> String {
    let lowercased = str.lowercased()
    
    guard lowercased.count == 2 else { return "" }
    
    // 0x1F1E6 is first in the Regional Indicator Symbol range, 'A'
    // 0x61 is the first in the lowercase ASCII alphabet, 'a'
    let regionalIndicators = lowercased.unicodeScalars.map { UnicodeScalar($0.value + (0x1F1E6 - 0x61))! }
    
    // Using string interpolation doesn't create the emoji
    return String(regionalIndicators.map { Character($0) })
}

convertToEmoji(str: "US")
