//
//  HomeView.swift
//  FillMyCycle
//
//  Created by Anam Ansari on 22/11/22.
//

import SwiftUI

struct HomeView: View {
    @State var c1 = 0
    @State var c2 = 0
    
    @ObservedObject var cycle1 = NumbersOnly()
    @ObservedObject var cycle2 = NumbersOnly()
    
    var body: some View {
        List{
            Section(header: Text("Cycle")){
                HStack{
                    VStack {
                        Label("Cycle 1", systemImage: "timer")
                        HStack{
                            Text("1").frame(maxWidth: .infinity, alignment: .center)
                            Text("to").frame(maxWidth: .infinity, alignment: .center)
                            TextField(cycle1.value, text: $cycle1.value)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                        }
                    }
                    Divider()
                    VStack {
                        Label("Cycle 2", systemImage: "timer")
                        HStack{
                            Text(String((Int(cycle1.value) ?? 1) + 1)).frame(maxWidth: .infinity, alignment: .center)
                            Text("to").frame(maxWidth: .infinity, alignment: .center)
                            TextField(cycle2.value, text: $cycle2.value).multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                        }
                    }
                }
                if(((Int(cycle2.value) ?? 0) > (Int(cycle1.value) ?? 0)) && (Int(cycle2.value) ?? 0) < 11 && (Int(cycle1.value) ?? 0) < 9){
                    NavigationLink(destination: CycleView(cycle1: $cycle1.value, cycle2: $cycle2.value)){
                        Text("Enter Marks").frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            
        }
        .navigationBarTitle(Text("Fill My Cycle"))
        .toolbar(){
            ToolbarItem(){
                VStack{
                    NavigationLink(destination: HelpView()){
                        Text("Help")
                    }
                }
            }
            ToolbarItem(placement: .bottomBar){
                VStack{
                    Text("Developed by Anam Ansari").font(.footnote)
                    Text("[@anamansari062](https://linktr.ee/anamansari062)").font(.footnote)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
    }
}
