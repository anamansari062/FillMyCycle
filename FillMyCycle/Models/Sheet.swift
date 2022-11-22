//
//  Sheet.swift
//  FillMyCycle
//
//  Created by Anam Ansari on 22/11/22.
//

import Foundation

class Sheet: ObservableObject{
    
    @Published var cycleT1 = [[0, 0, 0, 0, 0],
                              [0, 0, 0, 0, 0],
                              [0, 0, 0, 0, 0],
                              [0, 0, 0, 0, 0],
                              [0, 0, 0, 0, 0]]
    
    @Published var cycleT2 = [[0, 0, 0, 0, 0],
                              [0, 0, 0, 0, 0],
                              [0, 0, 0, 0, 0],
                              [0, 0, 0, 0, 0],
                              [0, 0, 0, 0, 0]]
        
    @Published var evalSheet = [[0,0,0,0,0,0],
                                [0,0,0,0,0,0],
                                [0,0,0,0,0,0],
                                [0,0,0,0,0,0]]
    
    @Published private var average1 = 0
    @Published private var average2 = 0
    
    private var c = [6,6,2,2,4]
    
    private var states = [[0,0,0,0,0],
                          [0,0,1,0,0],
                          [0,0,1,1,0],
                          [1,0,0,0,0],
                          [1,0,0,1,0],
                          [1,0,1,1,0],
                          [1,0,0,1,1],
                          [1,0,1,1,1],
                          [1,1,1,1,0],
                          [1,1,0,1,1]]
    
    init(arr1: [String], arr2: [String], len1: Int, len2: Int) {
        average1 = CalculateAvg(arr: arr1, len: len1)
        average2 = CalculateAvg(arr: arr2, len: len1)
        cycleT1 = CalculateTicks(avg: average1)
        cycleT2 = CalculateTicks(avg: average2)
        evalSheet = CalculateEvalSheet(avg1: average1, avg2: average2)
    }

    func CalculateAvg(arr: [String], len: Int) -> Int {
        var a = 0.0
        var avg = 0
        for num in arr {
            a += Double(num) ?? 0.0
        }
        a = a / Double(len)
        if(a > 100.0){
            return 100
        }
        else if(a < 20.0){
            return 20
        }
        
        avg = Int(floor(a))
        if(avg%2 == 1){
            avg += 1
        }
        
        return avg
    }

    func CalculateTicks(avg: Int) -> [[Int]]{
        var cycle = [[0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0]]
        
        let mod = (avg%20)/2
        let mul = avg/20
        for i in 0...4{
            cycle[i][5 - (mul + states[mod][i])] = 1
        }
        return cycle
    }
    
    func CalculateEvalSheet(avg1: Int, avg2: Int) -> [[Int]]{
        var evalSheet = [[0,0,0,0,0,0],
                        [0,0,0,0,0,0],
                        [0,0,0,0,0,0],
                        [0,0,0,0,0,0]]
        
        let mod1 = (avg1%20)/2
        let mul1 = avg1/20
        
        let mod2 = (avg2%20)/2
        let mul2 = avg2/20
        
        var total1 = 0
        var total2 = 0

        
        for i in 0...4{
            evalSheet[0][i] = c[i] * (mul1 + states[mod1][i])
            evalSheet[1][i] = c[i] * (mul2 + states[mod2][i])
            evalSheet[2][i] = evalSheet[0][i] + evalSheet[1][i]
            evalSheet[3][i] = evalSheet[2][i]/2
            total1 += evalSheet[0][i]
            total2 += evalSheet[1][i]
        }
        
        evalSheet[0][5] = total1
        evalSheet[1][5] = total2
        evalSheet[2][5] = total1 + total2
        evalSheet[3][5] = evalSheet[2][5]/2
        
        return evalSheet
    }
}
