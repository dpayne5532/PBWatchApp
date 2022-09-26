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
      Color("darkGreen")
        .ignoresSafeArea()
      VStack {
        Text("Dan Payne made this")
        Text("bitches!")
      }
    }
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}
