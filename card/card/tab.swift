//
//  tab.swift
//  card
//
//  Created by Eatmyself on 2020/11/24.
//

import SwiftUI

struct tab: View {
    @StateObject var snakedata = snakeData()
    var body: some View {
        TabView {
            list(snakedata: snakedata)
            .tabItem {
                Image(systemName: "house.fill")
                Text("成員管理")
            }
            barlist(snakedata: snakedata)
            .tabItem {
                Image(systemName: "chart.bar.fill")
                Text("體重一覽表")
            }
        }
    }
}

struct tab_Previews: PreviewProvider {
    static var previews: some View {
        tab()
    }
}
