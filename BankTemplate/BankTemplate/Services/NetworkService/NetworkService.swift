//
//  NetworkService.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/26/24.
//

import Foundation

class NetworkService {
    
    func fetchClients() -> [Client] {
        let clients: [Client] = [
            Client(
                name: "Harut Vardanyan",
                avatar: "avatar1",
                card: "1234 5678 9012 3456",
                account: "account 1",
                balance: 1092,
                cardDate: "07/24",
                id: "1"
            ),
            Client(
                name: "Levon Shakhbazyan",
                avatar: "avatar2",
                card: "1844 1678 9642 0156",
                account: "account 2",
                balance: 790,
                cardDate: "09/27",
                id: "2"
            )
        ]

        return clients
    }
}
