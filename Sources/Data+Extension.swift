/*
 *  Data+Extension.swift
 *  hashicon-swift
 *
 *  This source code is provided under the Apache 2.0 license
 *  and is provided AS IS with no warranty or guarantee of fit for purpose.
 *  See the project's LICENSE.md for details.
 *  Copyright Thomson Reuters 2017. All rights reserved.
 *
 */

import Foundation

extension Data {
    
    func hex() -> String {
        return self.map { String(format: "%02hhx", $0) }.joined()
    }
    
    func bin() -> String {
        return self.reduce("") { (acc, byte) -> String in
            acc + String(byte, radix: 2)
        }
    }
    
}
