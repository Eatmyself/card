//
//  snakerow.swift
//  card
//
//  Created by Eatmyself on 2020/11/23.
//

import SwiftUI

struct snakerow: View {
    let s: snake
    
    var body: some View {
        ZStack{
            Image("格子")
            .resizable()
            .scaledToFill()
            .frame(width:UIScreen.main.bounds.width-20,height: 80)
            .edgesIgnoringSafeArea(.all)
            .clipped()
            HStack {
                Image("pic\(s.pic)")
                .resizable()
                .padding(.vertical, 2.0)
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(40)
                VStack(alignment: .leading) {
                    HStack{
                        s.gender ?Text("♀").foregroundColor(Color.pink):Text("♂").foregroundColor(Color.blue)
                        Text(s.name)
                    }
                    .font(.title3)
                    let a=Date().timeIntervalSince(s.lastfeed)
                    Text("上次餵食 \(Int(a/86400))天前")
                        .font(.caption2)
                        .offset(x: 110, y: 0)
                }
                Spacer()
            }
        }
    }
}

struct snakerow_Previews: PreviewProvider {
    static var previews: some View {
        let b=DateComponents(calendar: Calendar.current, year: 2020, month: 11, day: 7).date
        //Text(b ?? Date(), style: .date)
        snakerow(s:snake(pic:1,name:"里斯",weight:700,birthday:Date(),lastfeed:b ?? Date(),gender:false))
    }
}
