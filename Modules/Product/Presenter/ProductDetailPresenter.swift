//
//
//  Viper Creater 2.0
//  ProductPresenter.swift
//  Created by Umut BOZ on 04/09/2018.
//  Copyright © 2018 OneFrame Mobile - Koçsistem All rights reserved.
//

import Foundation
class ProductDetailPresenter: ProductDetailPresenterProtocol {

    weak var view: ProductDetailViewProtocol?
    var interactor: ProductDetailInteractorInputProtocol?
    var wireFrame: ProductWireFrameProtocol?

    func viewDidLoad() {
        //view?.showLoading()

    }
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {

}