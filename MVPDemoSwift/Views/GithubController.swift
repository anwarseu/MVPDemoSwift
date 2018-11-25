//
//  GithubController.swift
//  MVPDemoSwift
//
//  Created by Md Anwar Hossain on 25/11/18.
//  Copyright © 2018 Md Anwar Hossain. All rights reserved.
//

import UIKit

class GithubController: UIViewController {

    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var presenter: GithubPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = GithubPresenter(delegate: self)
        
    }
    
    @IBAction func btnGetData(_ sender: UIButton) {
        self.presenter?.getGithub()
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

extension GithubController: GithubDelegate{
    func showProgress(){
        self.startLoading()
    }
    func hideProgress(){
        self.stopLoading()
    }
    func succeed(github: MyGithub) {
        print(github.name ?? "No Data")
    }
    func error(message: String) {
        print(message)
    }
}
