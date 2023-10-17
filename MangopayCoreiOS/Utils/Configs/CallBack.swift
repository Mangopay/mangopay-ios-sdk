//
//  File.swift
//  
//
//  Created by Elikem Savie on 01/08/2023.
//

import Foundation
import MangopaySdkAPI

public struct CallBack {
    var onPaymentMethodSelected: ((PaymentMethod) -> Void)?
    var onTokenizationCompleted: ((MGPCardRegistration) -> Void)?
    var onPaymentCompleted: (() -> Void)?
    var onCancelled: (() -> Void)?
    var onError: ((MGPError) -> Void)?
    var onSheetDismissed: (() -> Void)?

    public init(
        onPaymentMethodSelected: ((PaymentMethod) -> Void)? = nil,
        onTokenizationCompleted: ( (MGPCardRegistration) -> Void)? = nil,
        onPaymentCompleted: ( () -> Void)? = nil,
        onCancelled: (() -> Void)?,
        onError: ((MGPError) -> Void)? = nil,
        onSheetDismissed: (() -> Void)? = nil
    ) {
        self.onPaymentMethodSelected = onPaymentMethodSelected
        self.onTokenizationCompleted = onTokenizationCompleted
        self.onPaymentCompleted = onPaymentCompleted
        self.onCancelled = onCancelled
        self.onError = onError
        self.onSheetDismissed = onSheetDismissed
    }
}
