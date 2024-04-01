import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var filtersSelectedCount = 0
    
    // State variables to store button tap count
    
    func updateTotalFiltersCount() {
        
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
                FilterButton(segmentTitle: "Persian", itemTitle: "Breed")
                FilterButton(segmentTitle: "Male", itemTitle: "Gender")
                FilterButton(segmentTitle: "Adult", itemTitle: "Age")
                FilterButton(segmentTitle: "Champion", itemTitle: "Pedigree")
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(segmentTitle)
                .font(.headline)
            
            Button(action: {
                
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
