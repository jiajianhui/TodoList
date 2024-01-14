//
//  TodoListApp.swift
//  TodoList
//
//  Created by 贾建辉 on 2023/5/29.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    //初始化viewmodel
    //@StateObject var listViewModel:ListViewModel
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(.stack)  //保证导航样式在iPhone、iPad上一致
            .environmentObject(ListViewModel())  //现在所有视图都可以访问viewmodel
            
        }
    }
}
