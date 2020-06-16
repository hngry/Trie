//
//  File.swift
//  
//
//  Created by marko on 6/16/20.
//

import Foundation

extension Array: Comparable where Element == Character {

    var string: String {
        return String(self)
    }

    public static func < (lhs: Array<Element>, rhs: Array<Element>) -> Bool {
        lhs.string < rhs.string
    }

}
