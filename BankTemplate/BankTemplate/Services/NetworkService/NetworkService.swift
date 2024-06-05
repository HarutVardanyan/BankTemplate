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
            cardNumber: "",
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
    
    let creditsDataStorage = CreditsDataStorage()
//
//    func fetchCredits(for userId: String) -> [Credit] {
//            return creditsDataStorage.credits.filter { $0.userId == userId }
//        }
//
    func fetchCredits(for userId: String) -> [Credit] {
        var userCredits: [Credit] = []

        for credit in creditsDataStorage.credits {
            if credit.userId == "1" {
                userCredits.append(credit)
            }
        }
        return userCredits
    }
}
