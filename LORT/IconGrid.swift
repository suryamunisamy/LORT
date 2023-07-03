//
//  IconGrid.swift
//  LORT
//
//  Created by ec2-user on 4/18/23.
//

import SwiftUI

struct IconGrid: View {
    @State var gridLayouts = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Currency
    var body: some View {
        LazyVGrid(columns: gridLayouts) {
            ForEach(0..<5) { i in
                if Currency.allCases[i] == currency{
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5))
                        .shadow(color:. black , radius: 9)
                }else{
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                }
                
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(.silverPiece))
    }
}
