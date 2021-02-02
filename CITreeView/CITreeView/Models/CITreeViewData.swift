//
//  CITreeViewData.swift
//  CITreeView
//
//  Created by Apple on 24.01.2018.
//  Copyright © 2018 Cenk Işık. All rights reserved.
//

import UIKit

class CITreeViewData {
    
    let name : String
    var children : [CITreeViewData]
    
    init(name : String, children: [CITreeViewData]) {
        self.name = name
        self.children = children
    }
    
    convenience init(name : String) {
        self.init(name: name, children: [CITreeViewData]())
    }
    
    func addChild(_ child : CITreeViewData) {
        self.children.append(child)
    }
    
    func removeChild(_ child : CITreeViewData) {
        self.children = self.children.filter( {$0 !== child})
    }
}

extension CITreeViewData {
    
    static func getDefaultCITreeViewData() -> [CITreeViewData] {
        
        let subChild121 = CITreeViewData(name: "Albea")
        let subChild122 = CITreeViewData(name: "Egea")
        let subChild123 = CITreeViewData(name: "Linea")
        let subChild124 = CITreeViewData(name: "Siena")
        
        let child11 = CITreeViewData(name: "Volvo")
        let child12 = CITreeViewData(name: "Fiat", children:[subChild121, subChild122, subChild123, subChild124])
        let child13 = CITreeViewData(name: "Alfa Romeo")
        let child14 = CITreeViewData(name: "Mercedes")
        let parent1 = CITreeViewData(name: "Sedan", children: [child11, child12, child13, child14])
        
        let subChild221 = CITreeViewData(name: "Discovery")
        let subChild222 = CITreeViewData(name: "Evoque")
        let subChild223 = CITreeViewData(name: "Defender")
        let subChild224 = CITreeViewData(name: "Freelander")
        
        let child21 = CITreeViewData(name: "GMC")
        let child22 = CITreeViewData(name: "Land Rover" , children: [subChild221,subChild222,subChild223,subChild224])
        let parent2 = CITreeViewData(name: "SUV", children: [child21, child22])
        
        
        let child31 = CITreeViewData(name: "Wolkswagen")
        let child32 = CITreeViewData(name: "Toyota")
        let child33 = CITreeViewData(name: "Dodge")
        let parent3 = CITreeViewData(name: "Truck", children: [child31, child32,child33])
        
        let subChildChild5321 = CITreeViewData(name: "Carrera", children: [child31, child32,child33])
        let subChildChild5322 = CITreeViewData(name: "Carrera 4 GTS")
        let subChildChild5323 = CITreeViewData(name: "Targa 4")
        let subChildChild5324 = CITreeViewData(name: "Turbo S")
        
        let parent4 = CITreeViewData(name: "Van",children:[subChildChild5321,subChildChild5322,subChildChild5323,subChildChild5324])
        
       
        
        let subChild531 = CITreeViewData(name: "Cayman")
        let subChild532 = CITreeViewData(name: "911",children:[subChildChild5321,subChildChild5322,subChildChild5323,subChildChild5324])
        
        let child51 = CITreeViewData(name: "Renault")
        let child52 = CITreeViewData(name: "Ferrari")
        let child53 = CITreeViewData(name: "Porshe", children: [subChild531, subChild532])
        let child54 = CITreeViewData(name: "Maserati")
        let child55 = CITreeViewData(name: "Bugatti")
        let parent5 = CITreeViewData(name: "Sports Car",children:[child51,child52,child53,child54,child55])

        let child6111 = CITreeViewData(name: "111")
        let child6112 = CITreeViewData(name: "112")
        let child6113 = CITreeViewData(name: "113")
        let child6121 = CITreeViewData(name: "121")
        let child6122 = CITreeViewData(name: "122")
        let child6123 = CITreeViewData(name: "123")
        let child6131 = CITreeViewData(name: "131")
        let child6132 = CITreeViewData(name: "132")
        let child6133 = CITreeViewData(name: "133")

        let child6211 = CITreeViewData(name: "211")
        let child6212 = CITreeViewData(name: "212")
        let child6213 = CITreeViewData(name: "213")
        let child6221 = CITreeViewData(name: "221")
        let child6222 = CITreeViewData(name: "222")
        let child6223 = CITreeViewData(name: "223")
        let child6231 = CITreeViewData(name: "231")
        let child6232 = CITreeViewData(name: "232")
        let child6233 = CITreeViewData(name: "233")

        let child6311 = CITreeViewData(name: "311")
        let child6312 = CITreeViewData(name: "312")
        let child6313 = CITreeViewData(name: "313")
        let child6321 = CITreeViewData(name: "321")
        let child6322 = CITreeViewData(name: "322")
        let child6323 = CITreeViewData(name: "323")
        let child6331 = CITreeViewData(name: "331")
        let child6332 = CITreeViewData(name: "332")
        let child6333 = CITreeViewData(name: "333")

        let child6110 = CITreeViewData(name: "110", children: [child6111, child6112, child6113])
        let child6120 = CITreeViewData(name: "120", children: [child6121, child6122, child6123])
        let child6130 = CITreeViewData(name: "130", children: [child6131, child6132, child6133])

        let child6210 = CITreeViewData(name: "210", children: [child6211, child6212, child6213])
        let child6220 = CITreeViewData(name: "220", children: [child6221, child6222, child6223])
        let child6230 = CITreeViewData(name: "230", children: [child6231, child6232, child6233])

        let child6310 = CITreeViewData(name: "310", children: [child6311, child6312, child6313])
        let child6320 = CITreeViewData(name: "320", children: [child6321, child6322, child6323])
        let child6330 = CITreeViewData(name: "330", children: [child6331, child6332, child6333])
        
        let child6100 = CITreeViewData(name: "100", children: [child6110, child6120, child6130])
        let child6200 = CITreeViewData(name: "200", children: [child6210, child6220, child6230])
        let child6300 = CITreeViewData(name: "300", children: [child6310, child6320, child6330])
        let parent6 = CITreeViewData(name: "Deep Tree", children: [child6100, child6200, child6300])
        
        return [parent5,parent2,parent1,parent3,parent4,parent6]
    }
    
    
}
