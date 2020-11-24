//
//  barlist.swift
//  card
//
//  Created by Eatmyself on 2020/11/24.
//

import SwiftUI

struct barlist: View {
    @ObservedObject var snakedata: snakeData
    let c:Array<Array<Double>>=[[139,161,138],[223,209,163],[114,82,88],[180,161,144],[139,82,78]]
    
    var body: some View {
        NavigationView {
        ZStack{
            Image("格子")
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .bottom){
                    ForEach(snakedata.snakes.indices, id: \.self) { (index) in
                        snakebar(s: snakedata.snakes[index])
                            .foregroundColor(Color(red: c[index%5][0]/255 ,green: c[index%5][1]/255, blue: c[index%5][2]/255))
                    }
                    
                }
            }
            .navigationTitle("體重一覽表")
        }
        }
    }
}

struct barlist_Previews: PreviewProvider {
    static var previews: some View {
        barlist(snakedata: snakeData())
    }
}
