//
//  EvalSheetIndex.swift
//  FillMyCycle
//
//  Created by Anam Ansari on 22/11/22.
//

import SwiftUI

struct EvalSheetIndex: View {
    var rows = ["Cycle", "TK", "TD", "LI", "B", "C", "Total"]
    
    var body: some View {
        HStack {
            ForEach(0..<7) { index in
                Text(rows[index]).frame(maxWidth: .infinity)
                if(index != 6){
                    Divider()
                }
            }
        }
    }
}

struct EvalSheetIndex_Previews: PreviewProvider {
    static var previews: some View {
        EvalSheetIndex()
    }
}
