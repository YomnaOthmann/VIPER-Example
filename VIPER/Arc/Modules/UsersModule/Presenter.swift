//
//  Presenter.swift
//  VIPER
//
//  Created by Mac on 18/04/2024.
//

import Foundation


class UserPresenter: AnyPresenter{

    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet{
            self.interactor?.getUsers()
        }
    }
    
    var view: AnyView?
    var users: [User]?

    func didFetchUsers(with result: Result<[User], Error>) {
        switch result{
        case .success(let users):
            self.users = users
            view?.update(with: users)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
    func getUsers()->[User]?{
        guard let users = users else{
            return nil
        }
        return users
    }
    func getUsersCount()->Int{
        return users?.count ?? 0
    }
    
    
}
