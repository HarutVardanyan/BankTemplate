//
//  HomeScreenViewController.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/28/24.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // MARK: - Private Propertis
    
    private var client: Client?
    let networkService = NetworkService()
    let id: String
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.client = networkService.fetchClients(id: id)

    }
}


