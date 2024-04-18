//
//  Router.swift
//  VIPER
//
//  Created by Mac on 18/04/2024.
//

import Foundation
import UIKit


// Entry Point to arc


class UserRouter : AnyRouter{
    var view: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        interactor.presenter = presenter
        
        router.view = view as? AnyView & UIViewController
        return router
    }
    
    
}
