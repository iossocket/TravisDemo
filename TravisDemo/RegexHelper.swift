//
//  RegexHelper.swift
//  TravisDemo
//
//  Created by Xueliang Zhu on 1/26/16.
//  Copyright © 2016 Xueliang Zhu. All rights reserved.
//

import UIKit

struct RegexHelper {
    let regex: NSRegularExpression?
    
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
    }
    
    func match(input: String) -> Bool {
        let matches = regex?.matchesInString(input, options: [], range: NSMakeRange(0, input.characters.count))
        return matches?.count > 0
    }
}