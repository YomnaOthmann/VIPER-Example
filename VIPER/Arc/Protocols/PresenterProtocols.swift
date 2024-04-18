//
//  PresenterProtocols.swift
//  VIPER
//
//  Created by Mac on 18/04/2024.
//

import Foundation

protocol AnyPresenter{
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func didFetchUsers(with result: Result<[User], Error>)
}

enum FetchingError : Error{
    case failed
}
