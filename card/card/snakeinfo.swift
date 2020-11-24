//
//  snakeinfo.swift
//  card
//
//  Created by Eatmyself on 2020/11/24.
//

import SwiftUI

struct snakeinfo: View {
    var Index: Int
    @ObservedObject var snakedata: snakeData
    @State private var showEditsnake = false
    @State private var trimEnd = 0
    
    var body: some View {
        let editsnake=snakedata.snakes[Index]
        VStack{
        Form {
            Image("pic\(editsnake.pic)")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300 / 4 * 3)
                .clipped()
            HStack{
                Text("名字")
                Spacer()
                Text(editsnake.name)
            }
            HStack{
                Text("體重")
                Spacer()
                Text("\(editsnake.weight)g")
            }
            HStack{
                Text("生日")
                Spacer()
                Text(editsnake.birthday, style: .date)
            }
            HStack{
                Text("上次餵食")
                Spacer()
                Text(editsnake.lastfeed, style: .date)
            }
            HStack{
                Text("公/母")
                Spacer()
                editsnake.gender ?Text("♀").foregroundColor(Color.pink):Text("♂").foregroundColor(Color.blue)
            }
            ZStack{
                Circle()
                 .trim(from: 0, to: CGFloat(trimEnd)/200)
                 .stroke(Color(red: 114/255 ,green: 82/255, blue: 88/255),  style: StrokeStyle(lineWidth: 20,lineCap: .round))
                .animation(.linear(duration: 1))
                 .onAppear {
                    trimEnd = editsnake.weight
                 }
                VStack{
                    Text("可繁殖體重")
                        .fontWeight(.black)
                    HStack{
                        Text("\(editsnake.weight)")
                        .foregroundColor(Color(red: 223/255 ,green: 209/255, blue: 163/255))
                        .fontWeight(.black)
                        Text("/200")
                    }
                }
                .foregroundColor(Color.gray)
                 
            }
            .offset(x: 70, y: 0)
            .frame(width: 150, height: 200)
        }
        .navigationBarTitle(editsnake.name)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showEditsnake = true
                }, label: {
                    Text("Edit")
                    
                })
            }
        })
        .sheet(isPresented: $showEditsnake, content: {
            NavigationView {
                snakeEditor( editIndex: Index, snakedata: snakedata)
            }
        })
        
            
        }
    }
}

struct snakeinfo_Previews: PreviewProvider {
    static var previews: some View {
        snakeinfo(Index: 0,snakedata: snakeData())
    }
}

