//
//  ConvertToEmoji.playground
//
//  Derived from Tim Ekl's "EmojiFlags"
//  https://www.timekl.com/blog/2017/08/31/swift-tricks-emoji-flags/
//
//  Created by Neil Hiddink on 4/27/20.
//  Copyright © 2020 Neil Hiddink. All rights reserved.
//

// MARK: - CHALLENGE
/* In 30-45 minutes use Swift Playgrounds to write a Swift function, convertToEmoji(_:),
   that takes in a single parameter. The parameter should be a String representing one
   of the Alpha-2 country codes from ISO standard 3166
   (https://www.iso.org/iso-3166-country-codes.html).
 
   Given this parameter, the function should return the Emoji flag that matches the
   country that was passed in. For example:
   
   US = 🇺🇸
   CN = 🇨🇳
*/


import UIKit

func convertToEmoji(str: String) -> String {
    
    return ""
}

assert(convertToEmoji(str: "US") == "🇺🇸")
assert(convertToEmoji(str: "CN") == "🇨🇳")

print("🎉 All tests passed!")
