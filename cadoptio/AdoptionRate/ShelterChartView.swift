//
//  ShelterChartView.swift
//  cadoptio
//
//  Created by khoirunnisa' rizky noor fatimah on 30/04/25.
//

import SwiftUI
import Charts

struct ShelterChartView: View {
    var navigation: CardHeaderNavigation = .navigationLink
    
    var body: some View {
        CardContainer(height: 420) {
            VStack(alignment: .leading) {
                CardNavigationHeader(panel: .shelter, navigation: navigation) {
                    Label("Adoption Rates Among Shelter Cats", systemImage: "chart.line.uptrend.xyaxis")
                        .foregroundStyle(.orange)
                }.padding(.bottom, 4)
                
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
        }
    }
}

#Preview {
    ShelterChartView()
}

