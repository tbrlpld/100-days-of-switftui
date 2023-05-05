//
//  ContentView.swift
//  BetterRest
//
//  Created by Tibor Leupold on 5/3/23.
//
// This app calculated the recommended bedtime, based on when you want to wake up,
// how much sleep you typically like to get (you already need to know this), and
// how much coffee you drink. Drinking coffee during the day, usually means you
// need more time in bed to reach the desired amount of restful sleep.

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUpTime = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = "Recommended bed time"
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("When you want to wake up?")
                    .font(.headline)
                DatePicker(
                    "",
                    selection: self.$wakeUpTime,
                    displayedComponents: .hourAndMinute
                )
                    .labelsHidden()
                
                Text("How much sleep do you like?")
                    .font(.headline)
                Stepper(
                    "\(self.sleepAmount.formatted()) hours",
                    value: self.$sleepAmount,
                    in: 4...12,
                    step: 0.25
                )
                
                Text("How much coffee do you drink?")
                    .font(.headline)
                Stepper(
                    self.coffeeAmount == 1 ? "1 cup" : "\(self.coffeeAmount) cups",
                    value: self.$coffeeAmount,
                    in: 1...20
                )
            }
            .padding()
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Caclulate") {
                    self.calculateBedTime()
                }
            }
            .alert(self.alertTitle, isPresented: self.$showAlert) {
                Button("Ok") {}
            } message: {
                Text(self.alertMessage)
            }
        }
    }
    
    func calculateBedTime() {
        print("Calculating bed time...")
        let wakeUpTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: self.wakeUpTime)
        let wakeUpTimeSeconds = (
            self.hoursInSeconds(wakeUpTimeComponents.hour ?? 0)
            + self.minutesInSeconds(wakeUpTimeComponents.minute ?? 0)
        )
        print(wakeUpTimeSeconds)
        
        let config = MLModelConfiguration()
        
        do {
            let model = try BedTimeCalculator(configuration: config)
            let prediction = try model.prediction(
                wake: Double(wakeUpTimeSeconds),
                estimatedSleep: Double(self.sleepAmount),
                coffee: Double(self.coffeeAmount)
            )
            let recommendedSleepAmountSeconds = prediction.actualSleep
            let recommendedBedTime = self.wakeUpTime - recommendedSleepAmountSeconds
            self.alertMessage = String(recommendedBedTime.formatted(date: .omitted, time: .shortened))
        } catch {
            self.alertTitle = "Error"
            self.alertMessage = "Sorry, something went wrong."
        }
        
        self.showAlert = true
    }
    
    func hoursInMinutes(_ hours: Int) -> Int {
        return hours * 60
    }
    
    func minutesInSeconds(_ minutes: Int) -> Int {
        return minutes * 60
    }
    
    func hoursInSeconds(_ hours: Int) -> Int {
        let minutes = self.hoursInMinutes(hours)
        return self.minutesInSeconds(minutes)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
