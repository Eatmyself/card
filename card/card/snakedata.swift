//
//  snakedata.swift
//  card
//
//  Created by Eatmyself on 2020/11/23.
//

import Foundation

class snakeData: ObservableObject {
    @AppStorage("snakes") var snakedata: Data?
    
    @Published var snakes = [snake](){
            didSet {
                let encoder = JSONEncoder()
                do {
                    let data = try encoder.encode(snakes)
                    snakedata = data
                } catch {
                
                }
            }
        }
}
