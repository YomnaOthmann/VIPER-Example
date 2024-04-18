//
//  Interactor.swift
//  VIPER
//
//  Created by Mac on 18/04/2024.
//

import Foundation

// Business Logic
// Api calls
 // https://jsonplaceholder.typicode.com/users

class UserInteractor: AnyInteractor{
    var presenter: AnyPresenter?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            guard let data = data, error == nil else{
                self?.presenter?.didFetchUsers(with: .failure(FetchingError.failed))
                return
            }
            do{
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.didFetchUsers(with: .success(users))
            }catch let error{
                self?.presenter?.didFetchUsers(with: .failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}
