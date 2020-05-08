//
//  ContentView.swift
//  Convert
//
//  Created by Justin Schwartz on 5/3/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var inputUnit = 1
    @State private var outputUnit = 1
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var result: String {
        let valueInput: Measurement<UnitTemperature>
        let valueOutput: Measurement<UnitTemperature>
        let output: String
        
        switch inputUnit {
        case 1:
            valueInput = Measurement(value: Double(input) ?? 0, unit: UnitTemperature.fahrenheit)
            break
        case 2:
            valueInput = Measurement(value: Double(input) ?? 0, unit: UnitTemperature.kelvin)
            break
        default:
            valueInput = Measurement(value: Double(input) ?? 0, unit: UnitTemperature.celsius)
            break
        }
        
        switch outputUnit {
        case 1:
            valueOutput = valueInput.converted(to: .fahrenheit)
        case 2:
            valueOutput = valueInput.converted(to: .kelvin)
        default:
            valueOutput = valueInput.converted(to: .celsius)
        }
        
        let format = MeasurementFormatter()
        format.unitOptions = .providedUnit
        output = format.string(from: valueOutput)
        return output;
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value", text: $input)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Converted Value")) {
                    Text(result)
                }
            }
        .navigationBarTitle("Convert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
