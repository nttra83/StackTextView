//
//  ViewController.swift
//  StackTextViewDemo
//
//  Created by Zheng-Xiang Ke on 2017/4/10.
//  Copyright © 2017年 Zheng-Xiang Ke. All rights reserved.
//

import UIKit
import StackTextView

class ViewController: UIViewController {
    
    @IBOutlet weak var stackTextView: StackTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stackTextView.spacing = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonDidClick(sender: AnyObject?) {
        let alertController = UIAlertController(title: "StackTextView Demo", message: "Button is Clicked!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func addImageView(sender: AnyObject?) {
        guard let image = UIImage(named: "Apple") else {
            return
        }
        
        let scalingFactor: CGFloat = (stackTextView.frame.size.width < image.size.width) ? stackTextView.frame.size.width / image.size.width : 1.0
        if let resizedImage = image.resizeWithScale(sx: scalingFactor, sy: scalingFactor) {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: resizedImage.size.width, height: resizedImage.size.height))
            imageView.image = resizedImage
            stackTextView.addArrangedSubview(imageView)
        }
    }
    
    @IBAction func addButton(sender: AnyObject?) {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 0, y: 0, width: stackTextView.frame.size.width, height: 100)
        button.setTitle("Click Me", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonDidClick(sender:)), for: .touchUpInside)
        stackTextView.addArrangedSubview(button)
    }
    
    @IBAction func removeImage(sender: AnyObject?) {
        guard let view = stackTextView.arranged​Subviews.first else {
            return
        }
        
        stackTextView.removeArrangedSubview(view)
    }
}

