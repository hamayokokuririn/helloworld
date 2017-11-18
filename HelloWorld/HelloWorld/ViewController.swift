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
    private var upperView = UIView()
    private var belowView = UIView()
    
    override func loadView() {
        super.loadView()
        
        upperView.frame = CGRect(x: view.frame.size.width / 2 - 25,
                                 y: helloWorldLabel.frame.origin.y - 200,
                                 width: 50,
                                 height: 50)
        upperView.backgroundColor = UIColor.red
        view.addSubview(upperView)
        
        belowView.frame = CGRect(x: view.frame.size.width / 2 - 25,
                                 y: upperView.frame.origin.y + upperView.frame.size.height,
                                 width: 50,
                                 height: 50)
        belowView.backgroundColor = UIColor.blue
        view.addSubview(belowView)
    }
    
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
            
            if count % 2 == 1 {
                UIView.animate(withDuration: 0.3,
                               delay: 0,
                               usingSpringWithDamping: 0.8,
                               initialSpringVelocity: 0.0,
                               options: [.curveEaseIn],
                               animations: {
                                self.upperView.frame.size.height = 0
                                self.belowView.frame.origin.y = self.upperView.frame.origin.y
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3,
                               delay: 0,
                               usingSpringWithDamping: 0.5,
                               initialSpringVelocity: 0.0,
                               options: [.curveEaseIn], animations: {
                                self.upperView.frame.size.height = 50
                                self.belowView.frame.origin.y = self.upperView.frame.origin.y + 50
                }, completion: nil)
            }

            
            if let helloText = helloWorldLabel.text,
                let helloCount = helloWorldLabel.text?.count {
                var helloTextList = helloText.map{
                    String($0)
                }
                if helloTextList[count - 1] == " " {
                    count += 1
                }
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

