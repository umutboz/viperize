//
//
//  Viper Creater 2.0
//  ProductWireFrame.swift
//  Created by Umut BOZ on 04/09/2018.
//  Copyright © 2018 OneFrame Mobile - Koçsistem All rights reserved.
//WireFrame

import UIKit

class ProductWireFrame: ProductWireFrameProtocol {

  static var productStoryboard: UIStoryboard {
     return UIStoryboard(name: "Product", bundle: Bundle.main)
  }

 //MARK: - Product
 class func createProductModuleWithStoryboard() -> UIViewController {
     let navController = productStoryboard.instantiateViewController(withIdentifier: "ProductNavigationController")
     if let view = navController.childViewControllers.first as? ProductView {
         let presenter: ProductPresenterProtocol & ProductInteractorOutputProtocol = ProductPresenter()
         let interactor: ProductInteractorInputProtocol = ProductInteractor()

         let wireFrame: ProductWireFrameProtocol = ProductWireFrame()

         view.presenter = presenter
         presenter.view = view
         presenter.wireFrame = wireFrame
         presenter.interactor = interactor
         interactor.presenter = presenter

         return navController
     }
     return UIViewController()
 }

 class func createProductModule() -> UIViewController {
       let view = productStoryboard.instantiateViewController(withIdentifier: String(describing: ProductView.self)) as! ProductView
       let presenter: ProductPresenterProtocol & ProductInteractorOutputProtocol = ProductPresenter()
       let interactor: ProductInteractorInputProtocol = ProductInteractor()
       let wireFrame: ProductWireFrameProtocol = ProductWireFrame()

       view.presenter = presenter
       presenter.view = view
       presenter.wireFrame = wireFrame
       presenter.interactor = interactor
       interactor.presenter = presenter

       return view
   }

   //DONT REMOVE '{FOR SUB}' COMMENT LINE
   //{FOR SUB}


    //MARK: - ProductDetail
class func createProductDetailModule() -> UIViewController {
   let view = productStoryboard.instantiateViewController(withIdentifier: String(describing: ProductDetailView.self)) as! ProductDetailView
   let presenter: ProductDetailPresenterProtocol & ProductDetailInteractorOutputProtocol = ProductDetailPresenter()
   let interactor: ProductDetailInteractorInputProtocol = ProductInteractor()
   let wireFrame: ProductWireFrameProtocol = ProductWireFrame()

   view.presenter = presenter
   presenter.view = view
   presenter.wireFrame = wireFrame
   presenter.interactor = interactor
   interactor.presenterDetail = presenter
   return view
}


    


    


    


    


    


    


    


    


    


    


    


    


    


}