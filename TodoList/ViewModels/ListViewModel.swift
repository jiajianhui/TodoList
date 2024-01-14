//
//  ListViewModel.swift
//  TodoList
//
//  Created by 贾建辉 on 2023/5/30.
//

import Foundation

/*
 CRUD
 
 C - 创建
 R - 读取
 U - 更新
 D - 删除
 
 
 */
class ListViewModel: ObservableObject {
    //发布数组，类型为itemModel
    @Published var items:[ItemModel] = [] {
        didSet {
            saveItems()  //删除、移动、增加都会调用这个函数来保存数据
        }
    }
    
    let itemsKey:String = "items_key"  //提取数据时的key
    
    
    //初始化
    init() {
        getItem()
    }
    
    //获取数据函数
    func getItem() {
//        let newItems = [
//            ItemModel(title: "item1", isCompleted: true),
//            ItemModel(title: "item2", isCompleted: false),
//            ItemModel(title: "item3", isCompleted: true)
//        ]
//        items.append(contentsOf: newItems)
        
        //从用户默认值提取数据
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = saveItems
                
                
    }
    
    //删除
    func deleteItem(indexSet:IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    //移动
    func moveItem(from: IndexSet, to : Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    //增加
    func addItem(item:String) {
        let newItem = ItemModel(title: item, isCompleted: false)
        items.append(newItem)
    }
    
    //更新
    func updateItem(item:ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateComepletion()
        }
    }
    
    //将数据存储到用户默认值
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
}
