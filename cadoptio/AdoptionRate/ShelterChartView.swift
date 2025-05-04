//
//  ShelterChartView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 30/04/25.
//

import SwiftUI
import Charts

struct ShelterChartView: View {
    var body: some View {
        VStack(alignment: .leading) {
           
            Label("Adoption Rates Among Shelter Cats", systemImage: "chart.line.uptrend.xyaxis")
                .font(.headline)
            
            Chart {
                ForEach(ShelterAdoption.getSampleData()) { dataPoint in
                    LineMark(
                        x: .value("Year", dataPoint.year),
                        y: .value("Adoption Rate", dataPoint.adoptionRate)
                    )
                    .foregroundStyle(by: .value("Breed", dataPoint.breed))
                    .symbol(by: .value("Breed", dataPoint.breed))
                }
            }
            .chartYAxisLabel("Adoption Rate (%)")
            .chartLegend(position: .bottom)
            .frame(height: 300)
            
            Text("* Data reflects shelter cat adoptions from 2021 with forecasting for 2025")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.top, 8)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.adaptiveSystemBackground.opacity(0.95))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
        .padding([.horizontal, .top])
    }
}

#Preview {
    ShelterChartView()
}

