//
//  snakebar.swift
//  card
//
//  Created by Eatmyself on 2020/11/24.
//

import SwiftUI

struct snakebar: View {
    let s: snake

    var body: some View {
        VStack{
        Rectangle()
            .frame(width: 20, height: 700*CGFloat(s.weight)/1000)
            Text(s.name)
                .foregroundColor(.primary)
            Text("\(s.weight)g")
                .font(.caption)
                .foregroundColor(.primary)
        }
            
    }
}

struct snakebar_Previews: PreviewProvider {
    
    static var previews: some View {
        let c:Array<Array<Double>>=[[198,28,41],[23,200,40],[30,28,200]]
        Group {
            snakebar(s:snake(pic:1,name:"里斯",weight:200,birthday:Date(),lastfeed:Date(),gender:false))
                .foregroundColor(Color(red: c[2][0]/255 ,green: c[2][1]/255, blue: c[2][2]/255))
            snakebar(s:snake(pic:1,name:"里斯",weight:200,birthday:Date(),lastfeed:Date(),gender:false))
                .preferredColorScheme(.dark)
                .foregroundColor(Color(red: c[2][0]/255 ,green: c[2][1]/255, blue: c[2][2]/255))
        }
    }
}
