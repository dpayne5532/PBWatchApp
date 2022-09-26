//
//  ContentView.swift
//  PBWatchApp
//
//  Created by Dan Payne on 9/25/22.
//

import SwiftUI

struct ContentView: View {
  @State private var homeTot = 0
  @State private var awayTot = 0
  @State private var homeServe = false
  @State private var serverOne = true
  @State private var homeWins = false
  @State private var awayWins = false
  
    var body: some View {
        VStack {
          HStack {
           Text("\(homeTot)")
             .font(.title)
           Spacer()
           Text("\(awayTot)")
              .font(.title)
          }
          .padding()
          Spacer()
          Text(homeWins ? "HOME WINS!" : "")
          
          Text("\(homeServe ? "<<-- Serve ---" : "--- Serve -->>")")
            .font(.title)
            .bold()
            .padding()
          Text("Server -  \(serverOne ? "1" : "2")")
            .font(.title)
            .bold()
          Text(awayWins ? "AWAY WINS!" : "")
          Spacer()
          
          
          
          HStack {
            Button { homeScore()
            } label: {
              Text("Home")
                .frame(width: 150, height: 80)
                .background(homeServe ? Color("lightGreen") : Color("darkGreen"))
                .foregroundColor(.white)
                .cornerRadius(35)
              
            }
            Spacer()
            Button { awayScore()
            } label: {
              Text("Away")
                .frame(width: 150, height: 80)
                .background(homeServe ? Color("darkGreen") : Color("lightGreen"))
                .foregroundColor(.white)
                .cornerRadius(35)
              
            }
              
          
          }
          .padding()
          
        }
        .padding()
      
      
    }
  
  func homeScore() {
    if homeServe == true {
      homeTot += 1
      didHomeWin()
    } else if serverOne == false {
      homeServe = true
      serverOne = true
    } else if homeServe == false && serverOne == true {
      serverOne = false
    }
  }
  
  
  func awayScore() {
    if homeServe == false {
      awayTot += 1
      didAwayWin()
    } else if serverOne == false {
      homeServe = false
      serverOne = true
    } else if homeServe == true && serverOne == true {
      serverOne = false
    }
  }
  
  func didHomeWin() {
    if homeTot >= 11 && awayTot <= (homeTot - 2) {
      homeWins = true
      print("Home Team Wins!!!")
    }
  }
  
  func didAwayWin() {
    if awayTot >= 11 && homeTot <= (awayTot - 2) {
      awayWins = true
      print("Away Team Wins!!!")
    }
  }
  
  
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
