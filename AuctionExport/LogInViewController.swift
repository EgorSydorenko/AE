//
//  LogInViewController.swift
//  AuctionExport
//
//  Created by Denis Filipas on 10/18/15.
//  Copyright © 2015 Егор Сидоренко. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var emailField: UITextField! { didSet { emailField.delegate = self } }
    @IBOutlet weak var passwordField: UITextField! { didSet { passwordField.delegate = self } }
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShowNotification:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHideNotification:", name: UIKeyboardWillHideNotification, object: nil)
        
        //emailField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    
    }
    
    
    // MARK: - Form Events
    
    @IBAction func login() {
        switchLoading(to: true)
    }
    @IBAction func register() {
        switchLoading(to: true)
    }
    @IBAction func restorePassword() {
        switchLoading(to: true)
    }

    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    // MARK: - Keyboard notifications
    @IBOutlet weak var bottomLayoutContraint: NSLayoutConstraint!
    
    func keyboardWillShowNotification(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let keyboardEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let convertedKeyboardEndFrame = view.convertRect(keyboardEndFrame, fromView: view.window)
        let selectedField = emailField.isFirstResponder() ? emailField : passwordField
        
        let offset = selectedField.frame.maxY - convertedKeyboardEndFrame.minY
        if offset > -40 {
            view.frame.origin.y -= offset + 70
        }
    }
    
    func keyboardWillHideNotification(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    // MARK: - Private Methods
    
    private func switchLoading(to isLoading: Bool) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        if isLoading {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }
}

// MARK: - UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            login()
        }
        
        return true
    }
}