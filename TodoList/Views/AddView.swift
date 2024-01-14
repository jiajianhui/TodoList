//
//  AddView.swift
//  TodoList
//
//  Created by 贾建辉 on 2023/5/29.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode  //返回上一级
    @EnvironmentObject var listViewModel:ListViewModel  //环境对象
    @State var textFieldText:String = ""
    
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                TextField(text: $textFieldText) {
                    Text("Type something here...")
                }
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(10)
                
                //btn
                Button {
                    btnPress()
                    
                } label: {
                    Text("save".uppercased())
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .background(Color("AccentColor"))
                        .cornerRadius(10)
                }

            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    //按钮逻辑
    func btnPress() {
        if checkInput() {
            listViewModel.addItem(item: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    //检查输入框
    func checkInput() -> Bool {
        if textFieldText.count == 0 {
            alertTitle = "Please enter character"
            showAlert.toggle()
            return false
        }
        return true
    }
    //弹窗
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())  //方便预览
    }
}
