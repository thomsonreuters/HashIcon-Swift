/*
 *  HashIcon.swift
 *  hashicon-swift
 *
 *  This source code is provided under the Apache 2.0 license
 *  and is provided AS IS with no warranty or guarantee of fit for purpose.
 *  See the project's LICENSE.md for details.
 *  Copyright Thomson Reuters 2017. All rights reserved.
 *
 */

import UIKit
import CommonCrypto

public class HashIcon {
    
    let size: Int
    
    public init(size: Int) {
        self.size = size
    }
    
    public func drawIcon(input: String, container: UIView) -> Bool {
        guard let inputSHA256 = sha256(string: input) else {
            return false // failed to generate the Hash from input string
        }
        
        let m = matrix(from: inputSHA256)
        print("HashIcon structore: \(m.debugDescription)")
        
        let c = colour(from: inputSHA256)
        print("HashIcon blocks colour: \(c)")
        
        // Draw to container
        draw(matrix: m, with: UIColor.hexColor(hexString: c), to: container)
        
        return true
    }
    
    // MARK: - Private Methods
    
    // Draw a matrix inside a container with painted blocks.
    private func draw(matrix: [[Bool]], with color: UIColor, to container: UIView) {
        
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
                block.backgroundColor = (matrix[i][j] == true) ? color : UIColor.clear // Color
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
    
    private func matrix(from input: Data) -> [[Bool]] {
        let array = generateBinaryArray(buffer: input, length: size * size)
        var output = [[Bool]]()
        
        for i in 0..<size {
            var t = [Bool]()
            
            for j in 0..<size {
                let result = array[(i * size) + j] == "1"
                t.append(result)
            }
            output.append(t)
        }
        return output
    }
    
    // Generate Hash
    private func sha256(string: String) -> Data? {
        guard let data = string.data(using:String.Encoding.utf8) else { return nil }
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0, CC_LONG(data.count), &hash)
        }
        return Data(bytes: hash)
    }
    
    // Array with '0' and '1' values
    private func generateBinaryArray(buffer: Data, length: Int) -> Array<Character> {
        let bin = buffer.bin()
        let string = paddding(padChar: "0", trimmingLength: length, inputString: bin)
        return Array(string.characters)
    }
    
    // Get Colour from input data
    private func colour(from input: Data) -> String {
        let hex = input.hex()
        let s = paddding(padChar: "0", trimmingLength: 6, inputString: hex)
        return "#" + s
    }
    
    // Add padding and trimming
    private func paddding(padChar: String, trimmingLength: Int, inputString: String) -> String {
        let s = (inputString + String(repeating: padChar, count: trimmingLength))
        let index = s.startIndex ..< s.index(s.startIndex, offsetBy: trimmingLength)
        return s.substring(with: index)
    }
    
}
