//
//  ContentView.swift
//  ScrollViewLazyVGridLagBug
//
//  Created by Orkhan Alikhanov on 3/15/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("")
      
      ZStack {
        Text("")
        
        ScrollView {
          Circle()
            .fill(Color.purple)
            .frame(height: UIScreen.main.bounds.height)
            .overlay(Group {
              let v = [
                "Scroll is laggy (high CPU) until LazyVGrid becomes visibile first time (Try in iPhone SE 2).",
                "",
                "Try bouncing the scrollview up, and you'll see high cpu.",
                "Then make LazyVGrid visible and try boucing again (now low CPU)"
              ]
              
              Text(v.joined(separator: "\n"))
                .padding(50)
                .foregroundColor(.white)
            })
          
          VStack {
            Text("Down ↓")
            
            VStack {
              Text("A bit more ↓")
              
              LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))], spacing: 20) {
                ForEach(0..<10) { _ in
                  VStack {
                    Text("some long text. some long text. some long text. some long text. some long text. some long text. some long text. ")
                    
                    HStack {
                      if false {
                        Text("")
                      }
                      
                      Spacer()
                    }
                  }
                }
              }
            }
          }
          .padding(.bottom) // seems like it boosts the lag, maybe it adds more Stacks internally
        }
      }
    }
  }
}
