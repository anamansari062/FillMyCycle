//
//  CycleView.swift
//  FillMyCycle
//
//  Created by Anam Ansari on 22/11/22.
//

import SwiftUI

struct CycleView: View {
    @Binding var cycle1: String
    @Binding var cycle2: String
    
    @State private var array1 = ["", "", "", "", "", "", "", ""]
    @State private var array2 = ["", "", "", "", "", "", "", "", "", ""]
    
    @State private var isPresentingResultView = false
    
    var body: some View {
        List{
            Section(header: Text("Cycle")){
                HStack{
                    VStack {
                        Label("Cycle 1", systemImage: "timer")
                        Spacer()
                        HStack{
                            Text("1").frame(maxWidth: .infinity, alignment: .center)
                            Text("to").frame(maxWidth: .infinity, alignment: .center)
                            Text(cycle1).frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    Divider()
                    VStack {
                        Label("Cycle 2", systemImage: "timer")
                        Spacer()
                        HStack{
                            Text(String((Int(cycle1) ?? 0)+1)).frame(maxWidth: .infinity, alignment: .center)
                            Text("to").frame(maxWidth: .infinity, alignment: .center)
                            Text(cycle2).frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
            }
            
            Section(header: Text("Marks")){
                HStack{
                    VStack{
                        ForEach(0..<(Int(cycle1) ?? 0)){index in
                            TextField("0", text: $array1[index]).frame(maxWidth: .infinity, alignment: .center).keyboardType(.numberPad)
                        }
                    }
                    Divider()
                    VStack{
                        ForEach(0..<((Int(cycle2) ?? 0) - (Int(cycle1) ?? 0))){index in
                            TextField("0", text: $array2[index]).frame(maxWidth: .infinity, alignment: .center).keyboardType(.numberPad)
                        }
                    }
                }
                Button(action: {
                    isPresentingResultView = true
                }){
                    Text("Calculate").frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationBarTitle(Text("Fill My Cycle"))
        .sheet(isPresented: $isPresentingResultView){
            NavigationView {
                ResultView(sheet: Sheet(arr1: array1, arr2: array2, len1: (Int(cycle1) ?? 0), len2: ((Int(cycle2) ?? 0) - (Int(cycle1) ?? 0))))
                    .navigationTitle(Text("Lab Evaluation Sheet"))
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingResultView = false
                            }
                        }
                    }
            }
        }
        .toolbar(){
            ToolbarItem(){
                Button(action: {
                    array1 = ["", "", "", "", "", "", "", ""]
                    array2 = ["", "", "", "", "", "", "", "", "", ""]
                }){
                    Text("Reset")
                }
            }
            ToolbarItem(placement: .bottomBar){
                VStack{
                    Text("Developed by Anam Ansari").font(.footnote)
                    Text("@anamansari062").font(.footnote)
                }
            }
        }
    }
}

struct CycleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CycleView(cycle1: .constant("4"), cycle2: .constant("8"))
        }
    }
}
