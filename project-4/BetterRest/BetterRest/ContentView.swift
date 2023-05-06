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


struct CustomFormSection<Content: View>: View {
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 20) {
                self.content()
            }
                .padding(.vertical, 10)
        }
    }
}

struct ContentView: View {
    static var defaultWakeUpTime: Date {
        Calendar.current.date(bySettingHour: 7, minute: 30, second: 0, of: Date.now) ?? Date.now
    }
    
    @State private var wakeUpTime = Self.defaultWakeUpTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = "Recommended bed time"
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    
    var body: some View {
        NavigationView {
            Form {
                CustomFormSection {
                    Text("When you want to wake up?")
                        .font(.headline)
                    DatePicker(
                        "",
                        selection: self.$wakeUpTime,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                }
                
                CustomFormSection {
                    Text("How much sleep do you like?")
                        .font(.headline)
                    Stepper(
                        "\(self.sleepAmount.formatted()) hours",
                        value: self.$sleepAmount,
                        in: 4...12,
                        step: 0.25
                    )
                }
                
                CustomFormSection {
                    Text("How much coffee do you drink?")
                        .font(.headline)
                    Picker("Coffee", selection: self.$coffeeAmount) {
                        // We need to use `id: \.self` so that that stored value is the actual value in the range.
                        // By default, the index is stored (and we don't want the index as the coffee amount).
                        ForEach(1..<21, id: \.self) {
                            Text($0 == 1 ? "1 cup" : "\($0) cups")
                        }
                    }
                    .labelsHidden()
                }
                
                Section {
                    HStack(alignment: .center) {
                        Spacer()
                        VStack(spacing: 20){
                            Text("Recommended bed time")
                                .font(.title2)
                                .bold()
                            Text(self.calculateBedTime())
                        }
                        Spacer()
                    }
                }
                    .padding(20)
            }
            .navigationTitle("BetterRest")
            .alert(self.alertTitle, isPresented: self.$showAlert) {
                Button("Ok") {}
            } message: {
                Text(self.alertMessage)
            }
        }
    }
    
    func calculateBedTime() -> String {
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
            return String(recommendedBedTime.formatted(date: .omitted, time: .shortened))
        } catch {
            self.alertTitle = "Error"
            self.alertMessage = "Sorry, something went wrong."
            self.showAlert = true
            return ""
        }
        
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
