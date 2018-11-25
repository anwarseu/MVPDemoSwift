//
//  RegistrationPresenter.swift
//  MVPDemoSwift
//
//  Created by Md Anwar Hossain on 25/11/18.
//  Copyright © 2018 Md Anwar Hossain. All rights reserved.
//

import Foundation


protocol RegistrationDelegate{
    func showProgress()
    func hideProgress()
    func registrationDidSucceed()
    func registrationDidFailed(message: String)
}

class RegistrationPresenter{
    var delegate: RegistrationDelegate
    
    init(delegate: RegistrationDelegate) {
        self.delegate = delegate
    }
    
    func register(email: String, password: String, fullName: String, phoneNumber:String){
        if email.isEmpty{
            self.delegate.registrationDidFailed(message: "Email can't be blank")
            return
        }
        if password.isEmpty{
            self.delegate.registrationDidFailed(message: "Password can't be blank")
            return
        }
        if password.count < 8 {
            self.delegate.registrationDidFailed(message: "The minimum password length is 8 char")
            return
        }
        if fullName.isEmpty{
            self.delegate.registrationDidFailed(message: "Full name can't be blank")
            return
        }
        if phoneNumber.isEmpty{
            self.delegate.registrationDidFailed(message: "Phone number can't be blank")
            return
        }
        self.delegate.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.delegate.hideProgress()
            self.delegate.registrationDidSucceed()
        }
  }
    
}
