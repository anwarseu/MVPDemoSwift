//
//  RegistrationController.swift
//  MVPDemoSwift
//
//  Created by Md Anwar Hossain on 25/11/18.
//  Copyright © 2018 Md Anwar Hossain. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
     var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var presenter: RegistrationPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = RegistrationPresenter(delegate: self)
        
    }
    
    @IBAction func btnRegistration(_ sender: UIButton) {
        self.presenter?.register(email: emailTextField.text!, password: passwordTextField.text!, fullName: nameTextField.text!, phoneNumber: phoneTextField.text!)
    }
    
    func startLoading(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopLoading(){
        activityIndicator.stopAnimating()
        
    }
    
}

extension RegistrationController: RegistrationDelegate{
    func showProgress(){
        self.startLoading()
    }
    func hideProgress(){
        self.stopLoading()
    }
    func registrationDidSucceed(){
        print("succeed")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let githubController = storyBoard.instantiateViewController(withIdentifier: "github") as! GithubController
        self.navigationController?.pushViewController(githubController, animated: true)
        
    }
    func registrationDidFailed(message: String){
        self.emailTextField.attributedPlaceholder = NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    }
}

