//
//  ItemModel.swift
//  TodoList
//
//  Created by 贾建辉 on 2023/5/29.
//

import Foundation

//定义数据模型
//不可变数据结构
struct ItemModel:Identifiable, Codable {
    let id:String
    let title:String
    let isCompleted:Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    //模型所有的数据更新和逻辑都在这个函数中，调用这个函数完成数据更新
    func updateComepletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
