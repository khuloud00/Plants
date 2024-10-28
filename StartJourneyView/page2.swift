//
//  page2.swift
//  StartJourneyView
//
//  Created by khuloud nasser on 18/04/1446 AH.
//

import SwiftUI

struct page2: View {
    @State private var plantname = ""
    @FocusState private var focus:Bool

    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Text("")
                
                    .navigationTitle ("")
                TextField("Plant Name", text: $plantname)
                    .textFieldStyle(.roundedBorder)
                    
                    .padding(.horizontal, 20)
                    .focused($focus)
                    .foregroundColor(.white)
                
                Spacer()
                
                
            }
            .toolbar{
                ToolbarItem(placement: .principal) {
                                        Text("Set Reminder")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.top,20)
                        
                                    }
                
                
                
                
                ToolbarItem(placement: .topBarTrailing ){
                    Button(action: {
                        //todo
                    }, label:{
                        Text("Save")
                            .foregroundColor(.green)
                    })
                    

                }
                 
                ToolbarItem(placement:.topBarLeading ){
                    Button(action: {
                        //todo
                    }, label:{
                        Text("Cancel")
                            .foregroundColor(.green)

                    })
                    

                }
               
                
        }
            
        }
        .onAppear{
            focus = true
        }
    }
}

#Preview {
    page2()
}
