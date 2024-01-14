//
//  ListRowView.swift
//  TodoList
//
//  Created by 贾建辉 on 2023/5/29.
//

import SwiftUI

struct ListRowView: View {
    
    let item:ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


//可有可无
struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "item1", isCompleted: true)
    static var item2 = ItemModel(title: "item2", isCompleted: false)
    
    static var previews: some View {
        
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
            
        
    }
}
