import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var filtersSelectedCount = 0
    
    // State variables to store button tap count
    @State private var breedTapCount = 0
    @State private var genderTapCount = 0
    @State private var ageTapCount = 0
    @State private var pedigreeTapCount = 0
    
    // State variables to toggle the selection filter
    @State private var breedIsActive = false
    @State private var genderIsActive = false
    @State private var ageIsActive = false
    @State private var pegidreeIsActive = false
    
    func updateTotalFiltersCount() {
        filtersSelectedCount = breedTapCount + genderTapCount + ageTapCount + pedigreeTapCount
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text("Filters")
                    .font(.largeTitle)
                    .padding(.top)
            }
            .frame(maxWidth: .infinity)
            
            Group {
                FilterButton(segmentTitle: "Persian", itemTitle: "Breed", tapCount: $breedTapCount, isActive: $breedIsActive)
                    .onChange(of: breedTapCount) {
                        self.updateTotalFiltersCount()
                        self.breedIsActive.toggle()
                    }
                FilterButton(segmentTitle: "Male", itemTitle: "Gender", tapCount: $genderTapCount, isActive: $genderIsActive)
                    .onChange(of: genderTapCount) {
                        self.updateTotalFiltersCount()
                        self.genderIsActive.toggle()
                    }
                FilterButton(segmentTitle: "Adult", itemTitle: "Age", tapCount: $ageTapCount, isActive: $ageIsActive)
                    .onChange(of: ageTapCount) {
                        self.updateTotalFiltersCount()
                        self.ageIsActive.toggle()
                    }
                FilterButton(segmentTitle: "Champion", itemTitle: "Pedigree", tapCount: $pedigreeTapCount, isActive: $pegidreeIsActive)
                    .onChange(of: pedigreeTapCount) {
                        self.updateTotalFiltersCount()
                        self.pegidreeIsActive.toggle()
                    }
                // Add more buttons as necessary
            }
            .padding(.top, 12)
            .padding(.horizontal)
            
            VStack {
                Spacer()
                Text("Total: \(filtersSelectedCount) filters applied")
                    .font(.headline)
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Apply")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

struct FilterButton: View {
    var segmentTitle: String
    var itemTitle: String
    @Binding var tapCount: Int
    @Binding var isActive: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(segmentTitle)
                .font(.headline)
            
            Button(action: {
                self.tapCount += 1
            }) {
                Text(itemTitle)
                    .padding(12)
                    .background(isActive ? Color.red : Color.gray.opacity(0.1))
                    .foregroundColor(.primary)
                    .cornerRadius(8)
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
