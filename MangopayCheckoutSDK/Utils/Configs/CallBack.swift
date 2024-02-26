//
//  File.swift
//  
//
//  Created by Elikem Savie on 01/08/2023.
//

import Foundation

public struct CallBack {
    var onPaymentMethodSelected: ((PaymentMethod) -> Void)?
    var onTokenizationCompleted: ((TokenizedCardData) -> Void)?
    var onPaymentCompleted: ((String?, _3DSResult?) -> Void)?
    var onCreatePayment: ((PaymentMethod) async -> APMInfo?)?
    var onCreateCardRegistration: ((MGPCardInfo) async -> MGPCardRegistration?)?
    var onCancel: (() -> Void)?
    var onError: ((MGPError) -> Void)?
    var onSheetDismissed: (() -> Void)?

    public init(
        onPaymentMethodSelected: ((PaymentMethod) -> Void)? = nil,
        onTokenizationCompleted: ( (TokenizedCardData) -> Void)? = nil,
        onPaymentCompleted: ((String?, _3DSResult?) -> Void)? = nil,
        onCreatePayment: ((PaymentMethod) async -> APMInfo?)? = nil,
        onCreateCardRegistration: ((MGPCardInfo) async -> MGPCardRegistration?)? = nil,
        onCancelled: (() -> Void)?,
        onError: ((MGPError) -> Void)? = nil,
        onSheetDismissed: (() -> Void)? = nil
    ) {
        self.onPaymentMethodSelected = onPaymentMethodSelected
        self.onTokenizationCompleted = onTokenizationCompleted
        self.onCreatePayment = onCreatePayment
        self.onCreateCardRegistration = onCreateCardRegistration
        self.onPaymentCompleted = onPaymentCompleted
        self.onCancel = onCancelled
        self.onError = onError
        self.onSheetDismissed = onSheetDismissed
    }
}
