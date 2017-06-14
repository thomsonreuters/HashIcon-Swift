//
//  HashIcon.swift
//  NoPass-iOS
//
//  Created by Francisco Pereira on 23/05/2017.
//  Copyright © 2017 Francisco Pereira. All rights reserved.
//

import UIKit
import CommonCrypto

public class HashIcon {
    
    static let DefaultSize = 5
    
    public var size = DefaultSize
    
    public init(size: Int = DefaultSize) {
        self.size = size
    }
    
    public func drawIcon(input: String, container: UIView) {
        let inputSHA256 = sha256(string: input)
        
        let structure = getImageStructureForString(input: inputSHA256!)
        print(structure)
        
        let color = getImageColourForString(input: inputSHA256!)
        print(color)
        
        draw(structure: structure, color: hexColor(hexString: color), container: container)
    }
    
    private func draw(structure: [[Bool]], color: UIColor, container: UIView) {
        
        var previousHorizontalView: UIView?
        for i in 0..<size {
            
            let horizontalView = UIView()
            container.addSubview(horizontalView)
            horizontalView.translatesAutoresizingMaskIntoConstraints = false

            let margins = container.layoutMarginsGuide
            horizontalView.topAnchor.constraint(equalTo: previousHorizontalView?.bottomAnchor ?? margins.topAnchor).isActive = true
            horizontalView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            horizontalView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            
            // last one
            if (size - 1) == i {
                horizontalView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
            }

            if let previousHorizontalView = previousHorizontalView {
                horizontalView.heightAnchor.constraint(equalTo: previousHorizontalView.heightAnchor, multiplier: 1.0).isActive = true
            }
            
            var previousBlock: UIView?
            for j in 0..<size {
                
                let block = UIView()
                block.translatesAutoresizingMaskIntoConstraints = false
                block.backgroundColor = (structure[i][j] == true) ? color : UIColor.clear // Color
                horizontalView.addSubview(block)
                
                block.topAnchor.constraint(equalTo: horizontalView.topAnchor).isActive = true
                block.leadingAnchor.constraint(equalTo: previousBlock?.trailingAnchor ?? container.leadingAnchor).isActive = true
                block.bottomAnchor.constraint(equalTo: horizontalView.bottomAnchor).isActive = true
                
                if (size - 1) == j {
                    block.trailingAnchor.constraint(equalTo: horizontalView.trailingAnchor).isActive = true
                }
                
                if let previousBlock = previousBlock {
                    block.widthAnchor.constraint(equalTo: previousBlock.widthAnchor).isActive = true
                }
                
                previousBlock = block
            }
            
            previousHorizontalView = horizontalView
        }
    }
    
    private func getImageStructureForString(input: Data) -> [[Bool]] {
        let b = Array(bin(buffer: input, length: size * size).characters)
        var rtn = [[Bool]]()
        
        for i in 0..<size {
            var t = [Bool]()
            
            for j in 0..<size {
                let result = b[(i * size) + j] == "1"
                t.append(result)
            }
            rtn.append(t)
        }
        return rtn
    }
    
    private func compare(structureA: [[Bool]], structureB: [[Bool]]) -> Bool {
        print("<< A: \(structureA)")
        print("<< B: \(structureB)")
        for i in 0..<size {
            for j in 0..<size {
                guard structureA[i][j] == structureB[i][j] else { return false }
            }
        }
        return true
    }
    
    private func getImageColourForString(input: Data) -> String {
        return "#" + hex(buffer: input, length: 6)
    }
    
    private func sha256(string: String) -> Data? {
        guard let data = string.data(using:String.Encoding.utf8) else { return nil }
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0, CC_LONG(data.count), &hash)
        }
        return Data(bytes: hash)
    }
    
    private func hex(buffer: Data) -> String {
        return buffer.map { String(format: "%02hhx", $0) }.joined()
    }
    
    private func hex(buffer: Data, length: Int) -> String {
        let h = hex(buffer: buffer)
        return padAndTrimString(padChar: "0", length: length, inputString: h)
    }
    
    private func bin(buffer: Data) -> String {
        return buffer.reduce("") { (acc, byte) -> String in
            acc + String(byte, radix: 2)
        }
    }
    
    private func bin(buffer: Data, length: Int) -> String {
        let b = bin(buffer: buffer)
        return padAndTrimString(padChar: "0", length: length, inputString: b)
    }
    
    private func padAndTrimString(padChar: String, length: Int, inputString: String) -> String {
        let s = (inputString + String(repeating: padChar, count: length))
        let index = s.startIndex ..< s.index(s.startIndex, offsetBy: length)
        return s.substring(with: index)
    }
    
    private func hexColor(hexString: String) -> UIColor {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return .clear
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
}
