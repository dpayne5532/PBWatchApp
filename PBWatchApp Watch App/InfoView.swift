//
//  InfoView.swift
//  PBWatchApp Watch App
//
//  Created by Dan Payne on 9/26/22.
//

import SwiftUI

struct InfoView: View {
  var body: some View {
    ZStack {
      
      VStack {
        Text("Tap the button corresponding to the team that wins the round.")
        Spacer()
        Text("Tap the green arrow to reset the game.")
       
      }
    }
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}
