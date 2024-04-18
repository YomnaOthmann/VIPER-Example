//
//  InteractorProtocols.swift
//  VIPER
//
//  Created by Mac on 18/04/2024.
//

import Foundation

protocol AnyInteractor{
    
    var presenter: AnyPresenter? {get set
    }
    
    func getUsers()
}
