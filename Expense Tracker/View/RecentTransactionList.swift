//
//  RecentTransactionList.swift
//  Expense Tracker
//
//  Created by Yuri Petrosyan on 8/30/24.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        
        
        VStack {
            HStack {
                // MARK: Header Title
                Text("Recent Transactions")
                    .fontWeight(.bold)
                
                Spacer()
                // MARK: Header Link
                NavigationLink(destination: {
                    TransactionList()
                }, label: {
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.text)
                })
            }
            .padding(.top)
            
            // MARK: Recent Transaction List
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
              TransactionRow(transaction: transaction)
                
                    Divider()
                    .opacity(index == 4 ? 0 : 1)
                
               
                
            }
            
        }.padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

//#Preview {
//    RecentTransactionList()
//}


struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        RecentTransactionList()
            .environmentObject(transactionListVM)
    }
}
