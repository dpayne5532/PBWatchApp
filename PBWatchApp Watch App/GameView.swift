//
//  GameView.swift
//  PBWatchApp Watch App
//
//  Created by Dan Payne on 9/26/22.
//

import SwiftUI

struct GameView: View {
  @State private var homeTot = 0
  @State private var awayTot = 0
  @State private var homeServe = false
  @State private var serverOne = false
  @State private var homeWins = false
  @State private var awayWins = false
  @State private var alertIsVisible = false
  
  
  var body: some View {
    ZStack {
      
      Button {
        WKInterfaceDevice.current().play(.notification)
        self.alertIsVisible = true
      } label: {
        ZStack {
          Image( homeServe ? "ArrowLeft" : "ArrowRight")
            .resizable()
            .scaledToFit()
            .frame(width: 90)
          Text("Serv \(serverOne ? "1" : "2")")
            .bold()
            .font(.caption)
        }
      }
      .buttonStyle(PlainButtonStyle())
      .alert("Reset Game?", isPresented: $alertIsVisible) {
        
        Button("Reset Game", role: .destructive) {resetGame()}
        Button("Cancel", role: .cancel) {}
      } message: {
        
      }
      
      
      
      VStack {
        HStack {
          VStack {
            Text("Home")
            
            Text("\(homeTot)")
              .font(.title)
              .bold()
          }
          
          
          Spacer()
          VStack {
            Text("Away")
            
            Text("\(awayTot)")
              .font(.title)
              .bold()
          }
          
        }
        Spacer()
          .padding(.top, 35)
          .padding(.leading, 15)
          .padding(.trailing, 15)
        

        Spacer()
        Spacer()
        Spacer()
        
        
        HStack {
          Button {
            WKInterfaceDevice.current().play(.success)
            homeScore()
          } label: {
            Text("Home")
              .frame(width: 75, height: 50)
              .background(homeServe ? Color("lightGreen") : Color("darkGreen"))
              .foregroundColor(.white)
              .cornerRadius(15)
            
            
          }
          .alert("Home Team Wins!", isPresented: $homeWins) {
            Button("Reset Game") {resetGame()}
            
          } message: {
            
          }
          .padding(.trailing)
          
          Spacer()
          
          Button {
            WKInterfaceDevice.current().play(.success)
            awayScore()
          } label: {
            Text("Away")
              .frame(width: 75, height: 50)
              .background(homeServe ? Color("darkGreen") : Color("lightGreen"))
              .foregroundColor(.white)
              .cornerRadius(15)
            
          }
          .alert("Away Team Wins!", isPresented: $awayWins) {
            Button("Reset Game") {resetGame()}
            
          } message: {
            
          }
          .padding(.leading)
          
        }
        
        .padding()
        
      }
      .padding()
      
    }
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
    play(.click)
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
      
    }
    
  }
  
  func didAwayWin() {
    if awayTot >= 11 && homeTot <= (awayTot - 2) {
      awayWins = true
      
    }
  }
  
  func play(_ type: WKHapticType) {
    
  }
  
  
  func resetGame() {
    homeTot = 0
    awayTot = 0
    homeServe = false
    serverOne = false
    homeWins = false
    awayWins = false
  }
  
  
}





struct GameView_Previews: PreviewProvider {
  static var previews: some View {
    GameView()
  }
}
