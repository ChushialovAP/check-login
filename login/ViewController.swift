//
//  ViewController.swift
//  login
//
//  Created by Anton Chushialov on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var checkImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func textFieldChanged(_ sender: UITextField) {
        let queue = DispatchQueue.global(qos: .userInteractive)
        let nickname = sender.text!
        
        queue.async {
            if self.checkTextField(nickname) {
                DispatchQueue.main.async {
                    self.checkImageView.image = UIImage(systemName: "checkmark.rectangle")
                }
            } else {
                DispatchQueue.main.async {
                    self.checkImageView.image = UIImage(systemName: "xmark.rectangle")
                }
            }
        }
    }
    
    func checkTextField(_ text: String) -> Bool {
        let emailRegEx = "^(?=\\S{3,32})[a-zA-Z][a-zA-Z0-9\\.\\-]*(?:@\\w+\\.\\w{2,4})?$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: text)
    }
}

