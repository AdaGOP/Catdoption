//
//  FilterView.swift
//  cadoptio
//
//  Created by David Gunawan on 25/03/24.
//

import SwiftUI

import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) var dismiss
    @State private var breed: Set<String> = ["Persian"]
    @State private var gender: Set<String> = []
    @State private var age: Set<String> = []
    @State private var pedigree: Set<String> = []
    @State private var coatLength: Set<String> = []
    @State private var getsOnWith: Set<String> = []
    @State private var vaccinated: Set<String> = []
    @State private var character: Set<String> = []
    
    var body: some View {
        VStack {
            Text("Filters")
                .font(.title)
                .padding(.top)
            
            ButtonGroup(title: "Breed", selection: $breed, options: ["Persian"])
            
            ButtonGroup(title: "Gender", selection: $gender, options: ["Male", "Female"], isMultipleSelection: true)
            
            ButtonGroup(title: "Age", selection: $age, options: ["Baby", "Young", "Adult", "Senior"], isMultipleSelection: true)
            
            ButtonGroup(title: "Pedigree", selection: $pedigree, options: ["Yes", "No"])
            
            ButtonGroup(title: "Coat Length", selection: $coatLength, options: ["Short", "Medium", "Long"], isMultipleSelection: true)
            
            ButtonGroup(title: "Gets on with", selection: $getsOnWith, options: ["Cats", "Dogs", "Children"], isMultipleSelection: true)
            
            ButtonGroup(title: "Vaccinations", selection: $vaccinated, options: ["Yes", "No"])
            
            ButtonGroup(title: "Character", selection: $character, options: ["Active", "Friendly", "Playful", "Social", "Quite", "Independence", "Fierce", "Adventurous", "Low-maintenance"], isMultipleSelection: true)
            
            
            Spacer()
            
            Button(action: {
                dismiss()
            }) {
                Text("Apply")
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
    }
}

struct ButtonGroup: View {
    let title: String
    @Binding var selection: Set<String>
    let options: [String]
    let isMultipleSelection: Bool
    
    init(title: String, selection: Binding<Set<String>>, options: [String], isMultipleSelection: Bool = false) {
        self.title = title
        self._selection = selection
        self.options = options
        self.isMultipleSelection = isMultipleSelection
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            if isMultipleSelection {
                                if selection.contains(option) {
                                    selection.remove(option)
                                } else {
                                    selection.insert(option)
                                }
                            } else {
                                selection = [option]
                            }
                        }) {
                            Text(option)
                                .foregroundColor(isMultipleSelection ? (selection.contains(option) ? .white : .black) : (selection == [option] ? .white : .black))
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(isMultipleSelection ? (selection.contains(option) ? Color.orange : Color(UIColor.systemGray5)) : (selection == [option] ? Color.orange : Color(UIColor.systemGray5)))
                                .cornerRadius(20)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
