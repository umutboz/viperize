//
//
//  Viper Creater 2.0
//  ProductDetailView.swift
//  Created by Umut BOZ on 04/09/2018.
//  Copyright © 2018 OneFrame Mobile - Koçsistem All rights reserved.
//
import UIKit


class ProductDetailView: UIViewController {
    var presenter: ProductDetailPresenterProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

}

extension ProductDetailView: ProductDetailViewProtocol {

}