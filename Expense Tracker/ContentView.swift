//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Yuri Petrosyan on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
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
        }
    }
}
#Preview {
    ContentView()
}
#Preview {
        ContentView()
            .colorScheme(.dark)
}
