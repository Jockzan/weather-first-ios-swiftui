//
//  ContentView.swift
//  WeatherApp
//
//  Created by Cardona Basurto, Jockzan (Proagrica-CON) on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDayTime: Bool = true
    
    var body: some View {
        ZStack {
            let colors = if isDayTime {
                Gradient(colors: [Color.sunsetOrange, Color.coralPink, Color.goldenrod, Color.lightApricot, Color.peach])
            } else {
                Gradient(colors: [Color.lightPeach, Color.salmonPink, Color.rosePink, Color.mediumBlue, Color.darkBlue])
            }
            
            let mainImage = isDayTime ? "cloud.sun.fill" : "moon.stars"
            
            LinearGradient(
                gradient: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                Text("London")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                
                VStack(spacing: 4) {
                    Image(systemName: mainImage)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text("20°")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                }
                
                HStack {
                    DayWeatherContainer(dayName: "MON", imageName: "sun.max.fill", degreesTemperature: "28")
                    DayWeatherContainer(dayName: "TUE", imageName: "cloud.sun.rain.fill", degreesTemperature: "12")
                    DayWeatherContainer(dayName: "WED", imageName: "cloud.sun.bolt.fill", degreesTemperature: "10")
                    DayWeatherContainer(dayName: "THU", imageName: "wind.snow", degreesTemperature: "-1")
                    DayWeatherContainer(dayName: "FRI", imageName: "snow", degreesTemperature: "-5")
                }
                
                Spacer()
                
                Button(
                    action: {
                        isDayTime = !isDayTime
                    },
                    label: {
                        Text("Change Day Time")
                            .frame(width: 280, height: 50)
                            .background(.white)
                            .font(.system(size: 20, weight: .bold))
                            .cornerRadius(10)
                    }
                )
                
                Spacer()
            }
        }
    }
}

struct DayWeatherContainer: View {
    
    let dayName: String
    let imageName: String
    let degreesTemperature: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayName)
                .font(.system(size: 20))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text("\(degreesTemperature)°")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}
