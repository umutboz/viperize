//
//
//  Viper Creater 2.0
//  ProductPresenter.swift
//  Created by Umut BOZ on 04/09/2018.
//  Copyright © 2018 OneFrame Mobile - Koçsistem All rights reserved.
//

import Foundation
class ProductPresenter: ProductPresenterProtocol {

    weak var view: ProductViewProtocol?
    var interactor: ProductInteractorInputProtocol?
    var wireFrame: ProductWireFrameProtocol?

    func viewDidLoad() {
        //view?.showLoading()
        //interactor?.retrieveProduct()
    }
}

extension ProductPresenter: ProductInteractorOutputProtocol {
    /*
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    */
}