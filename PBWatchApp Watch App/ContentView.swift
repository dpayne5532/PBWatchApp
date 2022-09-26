//
//  ContentView.swift
//  PBWatchApp Watch App
//
//  Created by Dan Payne on 9/25/22.
//

import SwiftUI

struct ContentView: View {

  
    var body: some View {
      TabView {
        GameView()
        InfoView()
      }
  }
  
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
