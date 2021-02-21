//
//  ViewController.swift
//  LeakCheck
//
//  Created by 이가영 on 2021/02/21.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var john: Person?
    var unit4A: Apartment?
    
    var paragraph: HTMLElement? = HTMLElement(name: "p", text: " hello world")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")
        
        john!.apartment = unit4A
        unit4A!.tenant = john
        
        john = nil
        unit4A = nil
        
        print(paragraph!.asHTML())
        paragraph = nil
        
    }

}

class Person {
    let name: String
    init(name: String) { self.name = name }
  var apartment: Apartment?
    deinit { print("deinitalized")}
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person? //weak
    deinit { print("deinitalized")}
}

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text { //[unwoend self]
            return "\(self.name)text"
        }else {
            return "\(self.name)"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("deinit")
    }
}
