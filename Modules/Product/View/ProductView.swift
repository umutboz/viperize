//
//
//  Viper Creater 2.0
//  ProductView.swift
//  Created by Umut BOZ on 04/09/2018.
//  Copyright © 2018 OneFrame Mobile - Koçsistem All rights reserved.
//
import UIKit
//import PKHUD

class ProductView: UIViewController {

    //@IBOutlet weak var tableView: UITableView!
    var presenter: ProductPresenterProtocol?
    //var ProductList: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        //tableView.tableFooterView = UIView()
    }

}

extension ProductView: ProductViewProtocol {

    /*
    func showProducts(with Product: [Product]) {
        ProductList = Products
        tableView.reloadData()
    }

    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }

    func showLoading() {
        HUD.show(.progress)
    }

    func hideLoading() {
        HUD.hide()
    }
    */

}
/*
extension ProductView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell

        //let Product = searchProduct[indexPath.row]
        cell.set(forProduct: Product)

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchProduct.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showProductDetail(forProduct: searchProduct[indexPath.row])
    }

}
*/