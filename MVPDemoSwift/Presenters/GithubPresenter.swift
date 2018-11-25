//
//  GithubPresenter.swift
//  MVPDemoSwift
//
//  Created by Md Anwar Hossain on 25/11/18.
//  Copyright © 2018 Md Anwar Hossain. All rights reserved.
//

import Foundation

protocol GithubDelegate{
    func showProgress()
    func hideProgress()
    func succeed(github: MyGithub)
    func error(message: String)
}

class GithubPresenter{
    var delegate: GithubDelegate
    
    init(delegate: GithubDelegate) {
        self.delegate = delegate
    }
    
    func getGithub(){
        //when network call start user show progress
        self.delegate.showProgress()
        
        let url = URL(string: "https://api.github.com/users/anwarseu")
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) {
            data,response,error in
            guard let data = data else { return }
            do {
                let github = try JSONDecoder().decode(MyGithub.self, from: data)
                DispatchQueue.main.async() {
                    print(github)
                    self.delegate.hideProgress()
                    self.delegate.succeed(github: github)
                }
            } catch let error as NSError {
                self.delegate.hideProgress()
                self.delegate.error(message: error.localizedDescription)
            }
        }
        dataTask.resume()
    }

    
}
