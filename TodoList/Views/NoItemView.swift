//
//  NoItemView.swift
//  TodoList
//
//  Created by 贾建辉 on 2023/5/31.
//

import SwiftUI

struct NoItemView: View {
    
    //开启动画的变量
    @State var animate:Bool = false
    
    //颜色
    let accentColor = Color("AccentColor")
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("There are no items!There are no items!There are no items!There are no items!There are no items!")
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something🥳")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .background(animate ? accentColor : secondaryAccentColor)
                        .cornerRadius(10)
                        .padding(.top, 20)
                        .shadow(color: animate ? accentColor.opacity(0.3) : secondaryAccentColor.opacity(0.4),
                                radius: animate ? 20 : 10,
                                x: 0,
                                y: animate ? 20 : 10)
                }
                .padding(.horizontal, 40)
                .offset(y: animate ? -4 : 0)

            }
            .padding(30)
            .multilineTextAlignment(.center)
            
            //解决横屏模式下的排版
            .frame(maxWidth: 400)
            
            //调用动画函数的条件
            .onAppear {
                addAnimation()
        }
        }
    }
    
    //动画函数
    func addAnimation() {
        //如果动画已经在执行（animate为true）就return，不再执行下面的代码（只调用动画一次就行）
        guard !animate else { return }
        
        //延迟运行
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //动画详情
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)  //动画时长
                    .repeatForever()  //循环动画
            ) {
                 //当animate属性在true和false之间切换时，界面上受到影响的部分会以动画的形式进行变化
                animate.toggle()  //循环执行该操作
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("Title")
        }
        
    }
}
