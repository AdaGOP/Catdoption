import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var filtersSelectedCount = 0
    
    // State variables to store button tap count
    @State private var breedTapCount = 0
    @State private var genderTapCount = 0
    @State private var ageTapCount = 0
    @State private var pedigreeTapCount = 0
    
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
                FilterButton(segmentTitle: "Persian", itemTitle: "Breed", tapCount: $breedTapCount)
                    .onChange(of: breedTapCount) {
                        self.updateTotalFiltersCount()
                    }
                FilterButton(segmentTitle: "Male", itemTitle: "Gender", tapCount: $genderTapCount)
                    .onChange(of: genderTapCount) {
                        self.updateTotalFiltersCount()
                    }
                FilterButton(segmentTitle: "Adult", itemTitle: "Age", tapCount: $ageTapCount)
                    .onChange(of: ageTapCount) {
                        self.updateTotalFiltersCount()
                    }
                FilterButton(segmentTitle: "Champion", itemTitle: "Pedigree", tapCount: $pedigreeTapCount)
                    .onChange(of: pedigreeTapCount) {
                        self.updateTotalFiltersCount()
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(segmentTitle)
                .font(.headline)
            
            Button(action: {
                self.tapCount += 1
            }) {
                Text(itemTitle)
                    .padding(12)
                    .background(Color.gray.opacity(0.1))
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
