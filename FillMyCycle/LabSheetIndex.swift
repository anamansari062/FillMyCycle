//
//  LabSheetIndex.swift
//  FillMyCycle
//
//  Created by Anam Ansari on 22/11/22.
//

import SwiftUI

struct LabSheetIndex: View {
    var rows = ["Par/ Perf", "E (5)", "VG (4)", "G (3)", "A (2)", "BA (1)"]
    
    var body: some View {
        HStack {
            ForEach(0..<6) { index in
                Text(rows[index]).frame(maxWidth: .infinity)
                if(index != 5){
                    Divider()
                }
            }
        }
    }
}

struct LabSheetIndex_Previews: PreviewProvider {
    static var previews: some View {
        LabSheetIndex()
    }
}

