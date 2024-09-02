//
//  TransactionList.swift
//  Expense Tracker
//
//  Created by Yuri Petrosyan on 9/2/24.
//

import SwiftUI

struct TransactionList: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            
            List{
                
                // MARK: Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key){
                    month, trnsactions in
                    Section(month){
                        ForEach(trnsactions){ transaction in
                            TransactionRow(transaction: transaction)
                        }
                    }.listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}



struct TransactionList_Preview: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        NavigationStack {
            TransactionList()
        }
            .environmentObject(transactionListVM)
    }
}
