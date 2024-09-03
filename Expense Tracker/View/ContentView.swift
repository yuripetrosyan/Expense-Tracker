//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Yuri Petrosyan on 8/20/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: Chart
                    let data = transactionListVM.accumulateTransactions()
                    let totalExpenses = data.last?.1 ?? 0
                    
                    CardView {
                        VStack{
                            ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title)
                            
                            LineChart()
                        }
                                .background(Color(.systemBackground))
                        
                    }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: .background, foregroundColor: ColorGradient( Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                    
                    // MARK: Transaction List
                    RecentTransactionList()
                    
                    
                }.padding()
                    .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
                
                
                
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notigication Icon
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                    
                }
            }
        }.accentColor(.primary)
        
    }
}
//#Preview {
//    ContentView()
//}
//#Preview {
//        ContentView()
//            .colorScheme(.dark)
//}


struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
    }
}
