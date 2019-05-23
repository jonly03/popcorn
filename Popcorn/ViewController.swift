//
//  ViewController.swift
//  Popcorn
//
//  Created by Joseph Sugira on 4/25/19.
//  Copyright © 2019 Nelly Sugu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }


}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        // segue to Search View Controller

        return true
    }
}
