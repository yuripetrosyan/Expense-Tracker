//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Yuri Petrosyan on 8/20/24.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
                  
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
