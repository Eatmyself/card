//
//  list.swift
//  card
//
//  Created by Eatmyself on 2020/11/23.
//

import SwiftUI

struct list: View {
    @ObservedObject var snakedata: snakeData
    @State private var showEditsnake = false
    
    var body: some View {
        NavigationView {
            ZStack{
                List {
                    ForEach(snakedata.snakes.indices, id: \.self) { (index) in
                        
                        NavigationLink(
                            destination: snakeinfo(Index: index,snakedata: snakedata),
                            label: {
                        snakerow(s: snakedata.snakes[index])
                            })
                        
                    }
                    .onDelete(perform: { indexSet in
                        snakedata.snakes.remove(atOffsets: indexSet)
                    })
                    .listRowInsets(EdgeInsets())
                    
                }
                .navigationTitle("家中兒女")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showEditsnake = true
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                            
                        })
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Swipe left for DELETE")
                        
                    }
                })
                .sheet(isPresented: $showEditsnake, content: {
                    NavigationView {
                        snakeEditor(snakedata: snakedata)
                    }
                })
            }
        }
        
    }
}

struct list_Previews: PreviewProvider {
    static var previews: some View {
        list(snakedata: snakeData())
    }
}
