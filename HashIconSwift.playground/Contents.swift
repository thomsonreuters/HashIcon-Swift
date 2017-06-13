//: Playground - noun: a place where people can play

import PlaygroundSupport
import HashIconSwift
import UIKit

var str = "Hello, playground"

let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
view.backgroundColor = UIColor.yellow

HashIcon(size: 5).drawIcon(input: "Example", container: view)

view
