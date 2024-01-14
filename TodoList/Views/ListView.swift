//
//  ListView.swift
//  TodoList
//
//  Created by 贾建辉 on 2023/5/29.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {  //无todo时，展示空白页面
                NoItemView()
                    //页面切换时，添加过渡效果
                    .transition(AnyTransition.opacity.animation(.easeIn))
                
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            //点击手势
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem )
                    .onMove(perform: listViewModel.moveItem)
                    
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add",
                                     destination: AddView())
                            )
         
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())  //方便预览
    }
}

