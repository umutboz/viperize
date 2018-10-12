//
//
//  Viper Creater 2.0
//  ProductInteractor.swift
//  Created by Umut BOZ on 04/09/2018.
//  Copyright © 2018 OneFrame Mobile - Koçsistem All rights reserved.
//
import UIKit

class ProductInteractor {
    weak var presenter: ProductInteractorOutputProtocol?

    //DONT REMOVE '{FOR SUB_IN}' COMMENT LINE
    //{FOR SUB_IN}
    weak var presenterDetail : ProductDetailInteractorOutputProtocol?
    
    
    
}

//MARK: - Product
extension ProductInteractor: ProductInteractorInputProtocol {
    /*
     Authentication module consume or create data operations
     */
}

//DONT REMOVE '{FOR SUB}' COMMENT LINE
//{FOR SUB}

    //MARK: - ProductDetail
extension ProductInteractor : ProductDetailInteractorInputProtocol{

    /*
     ProductDetail module consume or create data operations
     */
}
