//
//  ClientsDataStorage.swift
//  BankTemplate
//
//  Created by MacBook Pro on 5/28/24.
//

import Foundation

struct ClientsDataStorage {
    let clients: [Client] = [
        Client(
            name: "Harutyun Vardanyan",
            avatar: "avatar1",
            cardNumber: "1234 5678 9012 3456",
            account: "123456789",
            balance: 1092,
            cardDate: "07/24",
            id: "1"
        ),
        Client(
            name: "Levon Shakhbazyan",
            avatar: "avatar2",
            cardNumber: "1844 1678 9642 0156",
            account: "account 2",
            balance: 790,
            cardDate: "09/27",
            id: "2"
        )
    ]
}
