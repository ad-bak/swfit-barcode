//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Adnan Bakaev  on 20/04/2025.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String

    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }

    func updateUIViewController(_ uiViewController: ScannerVC, context: Context)
    {}

    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }

    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }

    }
}

#Preview {
    ScannerView(scannedCode: .constant("123456"))
}
