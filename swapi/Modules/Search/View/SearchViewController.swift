//
//  SearchViewController.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import UIKit
import MBProgressHUD

class SearchViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: Properties
    
    fileprivate let progressHud = MBProgressHUD()
    
    var presenter: SearchPresentation?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "search.title".localized
        self.searchButton.setTitle("search.button.title".localized, for: .normal)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        self.view.addSubview(progressHud)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.loadDictionary()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dismissKeyboard()
    }
    
    // MARK: - Action
    
    @IBAction func searchButtonClick(_ sender: Any) {
        dismissKeyboard()
        hideInfoLabel()
        presenter?.searchButtonClick(withText: inputTextField.text)       
    }
    
}

extension SearchViewController: SearchView {
    
    func showProgress() {
         progressHud.show(animated: true)
    }
    
    func hideProgress() {
        progressHud.hide(animated: true)
    }
    
    func showInfoLabel(withText text: String) {
        infoLabel.isHidden = false
        infoLabel.text = text
    }
    
    func hideInfoLabel() {
        infoLabel.isHidden = true
    }    
    
}
