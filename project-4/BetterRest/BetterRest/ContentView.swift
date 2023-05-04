//
//  ContentView.swift
//  BetterRest
//
//  Created by Tibor Leupold on 5/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUpTime = Date.now
    
    var body: some View {
        VStack(spacing: 20) {
            Stepper(
                "\(self.sleepAmount.formatted())",
                value: self.$sleepAmount,
                in: 4...12,
                step: 0.25
            )
            DatePicker(
                "Wake up time?",
                selection: self.$wakeUpTime,
                in: Date.now...
            )
            Text(self.wakeUpTime, format: .dateTime.hour().minute().second())
            Text(self.wakeUpTime.formatted(date: .long, time: .shortened))
            Button("Test") {
                self.example()
            }
        }
        .padding()
    }
    
    func example() {
        var components = DateComponents()
        components.hour = 8
        components.minute = 31
        
        let dateWithSetHour = Calendar.current.date(bySetting: .hour, value: 8, of: Date.now) ?? Date.now
        let date = Calendar.current.date(bySetting: .minute, value: 31, of: dateWithSetHour) ?? Date.now
        print(type(of: date))
        print(date.formatted(date: .long, time: .complete))
        
        let nowComponents = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = nowComponents.hour ?? 0
        let minute = nowComponents.minute ?? 0
        print("\(hour):\(minute)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
