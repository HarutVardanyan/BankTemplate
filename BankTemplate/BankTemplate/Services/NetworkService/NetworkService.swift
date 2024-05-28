//
//  NetworkService.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/26/24.
//

import UIKit

class NetworkService {
    let clientsDataStorage = ClientsDataStorage()
    func fetchClients(id: String) -> Client {
        var myClient = Client(
            name: "",
            avatar: "",
            card: "",
            account: "",
            balance: 100,
            cardDate: "",
            id: ""
        )
        
        let clients = clientsDataStorage.clients
        
        for client in clients {
            if client.id == id {
                myClient = client
            }
        }
        
        return myClient
    }
}
