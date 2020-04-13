//
//  ContentView.swift
//  SwiftUIToDoList
//
//  Created by Chang Sophia on 4/11/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSettings: Bool = false
    
    @State var homeworks = [
        Homework(number: "#01" ,title:"給我一首歌的時間做App"),
        Homework(number: "#02" ,title:"擇偶條件App"),
        Homework(number: "#03" ,title:"問答題"),
        Homework(number: "#04" ,title:"用view拼湊漂亮的圖案"),
        Homework(number: "#05" ,title:"Auto Layout練習"),
        Homework(number: "#06" ,title:"猜數字和1A2BApp"),
        Homework(number: "#07" ,title:"Light App"),
        Homework(number: "#08" ,title:"甜蜜的Apple Pie(恐怖的Hangman)"),
        Homework(number: "#09" ,title:"鐵板神算App(回答問題的笨AI機器人)"),
        Homework(number: "#10" ,title:"猜拳遊戲"),
        Homework(number: "#11" ,title:"瘋狂購物App-UISepper和數字變字串練習"),
        Homework(number: "#12" ,title:"計算機App"),
        Homework(number: "#13" ,title:"彼得潘的影子-調色大師"),
        Homework(number: "#14" ,title:"搭配Sketch和Zeplin，製作iOS App畫面"),
        Homework(number: "#15" ,title:"化學元素週期表-用prepare傳遞資料"),
        Homework(number: "#16" ,title:"心理測驗或問卷App"),
        
    ]
    
    @State private var selectedHomework: Homework?
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(homeworks) { homework in
                    BasicHomeworkRow(homework: homework)
                        .contextMenu {
                            
                            Button(action: {
                                self.isDone(item: homework)
                            }) {
                                HStack{
                                    
                                Text("isDone")
                                Image(systemName:
                                    "checkmark")
                                    . foregroundColor(.blue)
                           
                            }
                    }
                    .onTapGesture {
                    self.selectedHomework = homework
            }
               
                }
                
        }
            .navigationBarTitle("Homeowrk")
        }
        }
        .navigationBarItems(trailing:
                Button(action: {
                    self.showSettings = true
                }, label: {
                    Image(systemName: "gear").font(.title)
                        .foregroundColor(.black)
                })
            )
                .sheet(isPresented: $showSettings) {
                            SettingView()
                    }
                }
    
    private func isDone(item homework: Homework) {
        if let index = self.homeworks.firstIndex(where: {
            $0.id == homework.id}) {
            self.homeworks[index].isDone.toggle()
        }
    }
}
struct Homework: Identifiable {
    var id = UUID()
    var number: String
    var title: String
    var isDone: Bool = false
    
   
        }
       
struct BasicHomeworkRow: View {
    var homework: Homework
    
    var body: some View {
        HStack{
        Text(homework.number)
        Text(homework.title)
            Spacer()
            .layoutPriority(-100)
            if homework.isDone {
            Image(systemName: "checkmark.fill")
                .foregroundColor(.blue)
        }
       
         
        
        }
    }
   
        }
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
