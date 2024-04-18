//
//  RouterProtocols.swift
//  VIPER
//
//  Created by Mac on 18/04/2024.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController
protocol AnyRouter{
    var view: EntryPoint? {get}
    static func start() -> AnyRouter
}
