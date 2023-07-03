//
//  SelectedCurrency.swift
//  LORT
//
//  Created by ec2-user on 4/17/23.
//

import SwiftUI

struct SelectedCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    var body: some View {
        ZStack{
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack{
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                IconGrid(currency: $leftCurrency)
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                IconGrid(currency: $rightCurrency)
                
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectedCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPenny))
    }
}
