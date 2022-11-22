//
//  HelpView.swift
//  FillMyCycle
//
//  Created by Anam Ansari on 22/11/22.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        List{
            Section(){
                Text("Enter the cycle numbers, only 10 maximum experiments are allowed.")
                Text("Click on Enter Marks.")
                Text("Enter respective experiment marks. If you do not enter anything, it will be considered 0. Values above 100 will be considered 100 only.")
                Text("Click on Calculate to get the Lab Evaluation Sheet")
            }
        }
        .navigationBarTitle(Text("How to Use"))
        .toolbar(){
            ToolbarItem(placement: .bottomBar){
                Text("[Reach out for Feedbacks](mailto:anamansari062@gmail.com)")
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HelpView()
        }
    }
}
