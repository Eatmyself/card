//
//  snakeEditor.swift
//  card
//
//  Created by Eatmyself on 2020/11/23.
//

import SwiftUI

struct snakeEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var editIndex: Int?
    var snakedata: snakeData
    @State private var pic:CGFloat=1
    @State private var name=""
    @State private var weight=0
    @State private var birthday=Date()
    @State private var lastfeed=Date()
    @State private var gender=false

    var body: some View {
        Form {
            Image("pic\(Int(pic))")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300 / 4 * 3)
                .clipped()
            Slider(value: $pic, in: 1...13, step: 1)
            TextField("名字", text: $name)
            Stepper("體重 \(weight)g", value: $weight, in: 0...1000,step: 50)
            DatePicker("生日", selection: $birthday,in: ...Date(), displayedComponents: .date)
            DatePicker("上次餵食", selection: $lastfeed,in: ...Date(), displayedComponents: .date)
            Toggle("公/母", isOn: $gender)
        }
        .onAppear(perform: {
            if let editIndex = editIndex {
                let editsnake = snakedata.snakes[editIndex]
                pic=CGFloat(editsnake.pic)
                name = editsnake.name
                weight = editsnake.weight
                birthday = editsnake.birthday
                lastfeed = editsnake.lastfeed
                gender = editsnake.gender
            }
        })
        .navigationBarTitle(editIndex == nil ? "Add new snake" : "Edit snake")
        .toolbar(content: {
            ToolbarItem {
                Button("Save") {
                    let Snake = snake(pic:Int(pic),name: name, weight: weight, birthday: birthday,lastfeed:lastfeed,gender:gender)
                    if let editIndex = editIndex {
                        snakedata.snakes[editIndex] = Snake
                    } else {
                        snakedata.snakes.insert(Snake, at: 0)

                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
        })
    }
}

struct snakeEditor_Previews: PreviewProvider {
    static var previews: some View {
        snakeEditor(snakedata:snakeData())
    }
}
