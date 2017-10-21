//
//  ViewController.swift
//  HelloWorld
//
//  Created by 齋藤健悟 on 2017/10/21.
//  Copyright © 2017年 齋藤健悟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloWorldLabel: UILabel!
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        helloWorldLabel.textColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchUpInsideTestButton(_ sender: UIButton) {
        if count == 0 {
            helloWorldLabel.textColor = .blue
            count = 1
        } else {
            if let helloText = helloWorldLabel.text,
                let helloCount = helloWorldLabel.text?.count {
                
                let attrText = NSMutableAttributedString(string: helloText)
                attrText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSMakeRange(0, count))
                helloWorldLabel.attributedText = attrText
                count += 1
                if count > helloCount {
                    count = 0
                }
            }
        }
    }
}

