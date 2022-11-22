//
//  ResultView.swift
//  FillMyCycle
//
//  Created by Anam Ansari on 22/11/22.
//

import SwiftUI

struct ResultView: View {
    @StateObject var sheet: Sheet

    var columnsLab = ["TK (30)", "TD (30)", "LI (10)", "B (10)", "C (20)"]
    var columnsEval = ["1", "2", "Total", "Average"]

    var body: some View {
        List{

            Section(header: Text("Cycle 1")){
//              Title row of Cycle 1
                LabSheetIndex()
//              Other rows of Cycle 1
                ForEach(0..<5){i in
                    HStack {
                        Text(columnsLab[i]).frame(maxWidth: .infinity)
                        Divider()
                        ForEach(0..<5) { index in
                            if(sheet.cycleT1[i][index] == 1){
                                Image(systemName: "checkmark").frame(maxWidth: .infinity)
                            }
                            else{
                                Text("").frame(maxWidth: .infinity)
                            }
                            if(index != 4){
                                Divider()
                            }
                        }
                    }
                }
            }
            
            Section(header: Text("Cycle 2")){
//              Title row for Cycle 2
                LabSheetIndex()
//              Other rows for Cycle 2
                ForEach(0..<5){i in
                    HStack {
                        Text(columnsLab[i]).frame(maxWidth: .infinity)
                        Divider()
                        ForEach(0..<5) { index in
                            if(sheet.cycleT2[i][index] == 1){
                                Image(systemName: "checkmark").frame(maxWidth: .infinity)
                            }
                            else{
                                Text("").frame(maxWidth: .infinity)
                            }
                            if(index != 4){
                                Divider()
                            }
                        }
                    }
                }
            }
            
            Section(header: Text("Evaluation Index Sheet")){
//              Evaluation Sheet title row
                EvalSheetIndex()
//              Evaluation Sheet other rows
                ForEach(0..<4){i in
                    HStack {
                        Text(columnsEval[i]).frame(maxWidth: .infinity)
                        Divider()
                        ForEach(0..<6) { index in
                            Text("\(sheet.evalSheet[i][index])").frame(maxWidth: .infinity)
                            if(index-5<0){
                                Divider()
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(sheet: Sheet(arr1: ["46", "46"], arr2: ["100", "100"], len1: 2, len2: 2))
    }
}

