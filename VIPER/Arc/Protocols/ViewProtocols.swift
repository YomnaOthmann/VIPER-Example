//
//  ViewProtocols.swift
//  VIPER
//
//  Created by Mac on 18/04/2024.
//

import Foundation

protocol AnyView{
    var presenter: AnyPresenter? {get set}
    func update(with users: [User])
    func update(with error: String)
}
