//
//  ContentView.swift
//  mustaqeem
//
//  Created by Daniya on 11/06/2019.
//  Copyright © 2019 nurios. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var firstName = ""
    @State var lastName = ""
    
    @State var users = [String]()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                VStack {
                    
                    VStack {
                        
                        Group {
                            TextField($firstName, placeholder: Text("First Name")).padding(12)
                        }.background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 5)
                        
                        Group {
                            TextField($lastName, placeholder: Text("Last Name")).padding(12)
                            }.background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(radius: 5)
                        
                        
                        
                        HStack {
                            
                            Button(action: {
                                
                                self.users.append("\(self.firstName) \(self.lastName)")
                                self.firstName = ""
                                self.lastName = ""
                                
                            }) {
                                Group {
                                    Text("Create user").color(.white).padding(12)
                                    }.background((firstName.count > 0 && lastName.count > 0 ? Color.blue : Color.gray))
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .shadow(radius: 5)
                            }.disabled(firstName.count == 0 || lastName.count == 0)
                            
                            Button(action: {
                                
                                self.users = []
                                
                            }) {
                                Group {
                                    Text("Delete users").color(.white).padding(12)
                                    }.background(Color.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .shadow(radius: 5)
                            }
                            
                        }
                        
                        
                    }.padding(12)
                    
                }.background(Color.gray)
                
                List (users.identified(by: \.self)) {
                    Text($0)
                }
            }.navigationBarTitle(Text("Credit Card Form"))
                .navigationBarItems(leading: HStack {
                    Text("First name:")
                    Text(firstName).color(.red)
                    Text("Last name:")
                    Text(lastName).color(.red)
                })
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
