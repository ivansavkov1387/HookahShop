//
//  ViewController.swift
//  HookahShop
//
//  Created by Иван on 4/15/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let patternImage = UIImage(named: "background.png") {
            self.view.backgroundColor = UIColor(patternImage: patternImage)
        }

        loginButton.layer.cornerRadius = 15
        
        
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Wrong username or password", message: "Enter valid data", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            self.usernameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if usernameTF.text == UserData.getUserData().name &&
            passwordTF.text == UserData.getUserData().password {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            showAlert()
        }
    }
    
    
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            textField.resignFirstResponder()
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed(loginButton)
        }
        return true
    }
}
