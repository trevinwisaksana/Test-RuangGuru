//
//  NumberViewModel.swift
//  Test
//
//  Created by Trevin Wisaksana on 14/12/18.
//  Copyright © 2018 Trevin Wisaksana. All rights reserved.
//

import Foundation

protocol NumberViewModel {
    var number: Int { get set }
}

struct NumberModel: NumberViewModel {
    var number: Int
}

struct DataSource {
    private var models = [NumberModel]()
    private var dataSourceHelper = DataSourceHelper()
    
    var numberOfItems: Int {
        return models.count
    }
    
    func item(at indexPath: IndexPath) -> NumberModel {
        return models[indexPath.row]
    }
    
    mutating func paginate(currentIndex: Int) {
        for index in currentIndex..<currentIndex + 10 {
            models.append(dataSourceHelper.data[index])
        }
    }
    
    mutating func loadData() {
        dataSourceHelper.createModels()
        
        for index in 0..<10 {
            models.append(dataSourceHelper.data[index])
        }
    }
}

struct DataSourceHelper {
    var data = [NumberModel]()
    
    mutating func createModels() {
        for i in 1...100 {
            data.append(NumberModel(number: i))
        }
    }
    
}
