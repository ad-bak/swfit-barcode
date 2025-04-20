//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Adnan Bakaev  on 15/04/2025.
//

import SwiftUI

struct BarcodeScannerView: View {
    @State private var scannedCode = ""  
    var body: some View {
        NavigationView{
            VStack{
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer().frame(height: 60, )
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder").font(.title2)
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode).bold().font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }.navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
