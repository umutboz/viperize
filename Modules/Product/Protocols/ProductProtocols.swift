//
//
//  Viper Creater 2.0
//  ProductProtocols.swift
//  Created by Umut BOZ on 04/09/2018.
//  Copyright © 2018 OneFrame Mobile - Koçsistem All rights reserved.
//
import UIKit

//MARK: - Product Shared Protocols
protocol ProductWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createProductModuleWithStoryboard() -> UIViewController
    static func createProductModule() -> UIViewController
    //func presentOtherScreen(from view: ProductViewProtocol, forModel model: Product)

    //DONT REMOVE '{FOR SUB_IN}' COMMENT LINE
    //{FOR SUB_IN}
    static func createProductDetailModule() -> UIViewController
    
    
    
    
    
    
    
    
    
    
    
    
    
}

//MARK: - Product
protocol ProductInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
}
protocol ProductInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ProductInteractorOutputProtocol? { get set }
}

protocol ProductViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ProductPresenterProtocol? { get set }

    //func showError()
    //func showLoading()
    //func hideLoading()
}

protocol ProductPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ProductViewProtocol? { get set }
    var interactor: ProductInteractorInputProtocol? { get set }
    var wireFrame: ProductWireFrameProtocol? { get set }

    func viewDidLoad()
}

//DONT REMOVE '{FOR SUB}' COMMENT LINE
//{FOR SUB}

    //MARK: - ProductDetail
protocol ProductDetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
}
protocol ProductDetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenterDetail: ProductDetailInteractorOutputProtocol? { get set }
}

protocol ProductDetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ProductDetailPresenterProtocol? { get set }

    //func showError()
    //func showLoading()
    //func hideLoading()
}

protocol ProductDetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ProductDetailViewProtocol? { get set }
    var interactor: ProductDetailInteractorInputProtocol? { get set }
    var wireFrame: ProductWireFrameProtocol? { get set }

    func viewDidLoad()
}
