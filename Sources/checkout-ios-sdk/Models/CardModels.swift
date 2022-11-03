//
//  File.swift
//  
//
//  Created by Elikem Savie on 02/11/2022.
//

import Foundation
import SchemaPackage
import ApolloAPI
import Apollo

struct FormData {
    let number: String?
    let name: String?
    let expMonth: Int?
    let expYear: Int?
    let cvc: String?
    let savePayment: Bool
    let bilingInfo: BillingInfo?

    func toPaymentCardInput() -> PaymentCardInput {
        
        let billing = bilingInfo == nil ? GraphQLNullable<BillingAddressInput>(bilingInfo!.toBillingAddressInput()) : nil

        let card = PaymentCardInput(
            number: number ?? "",
            expMonth: expMonth ?? 0,
            expYear: expYear ?? 0,
            cvc: (cvc ?? "").toGraphQLNullable(),
            name: (name ?? "").toGraphQLNullable(),
            billingAddress: billing,
            isDefault: true
        )
       
        return card
    }

    func toCardDtoInput() -> CardDtoInput {
        let _cvc = self.cvc ?? ""
        let billing = bilingInfo != nil ? GraphQLNullable<AddressDtoInput>(bilingInfo!.toAddressDtoInput()) : nil

        let card = CardDtoInput(
            number: number ?? "",
            expMonth: expMonth ?? 0,
            expYear: expYear ?? 0,
            cvc: (cvc ?? "").toGraphQLNullable(),
            name: (name ?? "").toGraphQLNullable(),
            address: billing
        )
        
        return card
    }
}


struct BillingInfo {
//        var __data: ApolloAPI.InputDict
    
    let line1: String?
    let line2: String?
    let city: String?
    let postalCode: String?
    let state: String?
    let country: String?
    
    func toBillingAddressInput() -> BillingAddressInput {
        return BillingAddressInput(
            line1: line1?.toGraphQLNullable() ?? nil,
            line2: line2?.toGraphQLNullable() ?? nil,
            city: city?.toGraphQLNullable() ?? nil,
            postalCode: postalCode?.toGraphQLNullable() ?? nil,
            state: state?.toGraphQLNullable() ?? nil,
            country: country?.toGraphQLNullable() ?? nil
        )
    }

    func toAddressDtoInput() -> AddressDtoInput {
        return AddressDtoInput(
            line1: line1?.toGraphQLNullable() ?? nil,
            line2: line2?.toGraphQLNullable() ?? nil,
            city: city?.toGraphQLNullable() ?? nil,
            postalCode: postalCode?.toGraphQLNullable() ?? nil,
            state: state?.toGraphQLNullable() ?? nil,
            country: country?.toGraphQLNullable() ?? nil
        )
    }
}

struct PaymentDtoInput {
    var type: String
    var token: String?
    var walletToken: String?
    var card: FormData?
    var googlePayId: String?

    func toPaymentDtoInput() -> PaymentMethodDtoInput {
        let card = card != nil ? GraphQLNullable<CardDtoInput>(card!.toCardDtoInput()) : nil
        let googlePay = googlePayId != nil ? GraphQLNullable<GooglePayInput>(GooglePayInput(transactionId: googlePayId!)) : nil

        return PaymentMethodDtoInput(
            type: type,
            token: token?.toGraphQLNullable() ?? nil,
            walletToken: walletToken?.toGraphQLNullable() ?? nil,
            card: card,
            googlePay: googlePay
        )
    }
}

struct AuthorisedPayment {
    var orderId: String?
    var flowId: String?
    var _3DSRedirect: String?
    var amount: String?
    var currencyCode: String?
    var paymentMethod: PaymentDtoInput
    var description: String?
    var headlessMode: Bool = false
    
    
//    struct PaymentMethod {
//        var type: String?
//        var token: String?
//        var walletToken: String?
//        var card: PaymentCardInput?
//        var googlePay: GooglePayInput?
//    }

    func toAuthorisedPaymentInput() -> AuthorisedPaymentInput {

        let paymentMethod = paymentMethod.toPaymentDtoInput()
        let headlessMode = GraphQLNullable<Bool>(booleanLiteral: headlessMode)

        let input = AuthorisedPaymentInput(
            orderId: (orderId ?? "").toGraphQLNullable(),
            flowId: (flowId ?? "").toGraphQLNullable() ,
            currencyCode: (currencyCode ?? "").toGraphQLNullable(),
            amount: (amount ?? "").toGraphQLNullable(),
            paymentMethod: paymentMethod,
            description: (description ?? "").toGraphQLNullable(),
            headlessMode: headlessMode
        )

        return input
    }
}

struct ShippingAddress {
    var address: BillingInfo?
    var name: String?
    var phone: String?
    
    var asDTO: ShippingAddressInput {
        let billing = address != nil ? GraphQLNullable<BillingAddressInput>(address!.toBillingAddressInput()) : nil
        
        return ShippingAddressInput(
            address: billing,
            name: name?.toGraphQLNullable() ?? nil,
            phone: phone?.toGraphQLNullable() ?? nil
        )
    }
}

struct Company {
    var name: String?
    var number: String?
    var taxId: String?
    var vatId: String?
    
    func toCompanyInput() -> CompanyInput {
        return CompanyInput(
            name: name?.toGraphQLNullable() ?? nil,
            number: number?.toGraphQLNullable() ?? nil,
            taxId: taxId?.toGraphQLNullable() ?? nil,
            vatId: vatId?.toGraphQLNullable() ?? nil
        )
    }
}

struct CustomerInputData {
    var card: FormData?
    var customer: Customer
    
    var toDTO: CustomerInput {
        let card = card != nil ? GraphQLNullable<PaymentCardInput>(card!.toPaymentCardInput()) : nil

        return CustomerInput(
            card: card,
            customer: customer.toDTO
        )
    }
}

struct Customer {
    var id: String?
    var billingAddress: BillingInfo?
    var description: String?
    var email: String?
    var name: String?
    var phone: String?
    var shippingAddress: ShippingAddress?
    var company: Company?

    var toDTO: VaultCustomerInput {
        let billing = billingAddress != nil ? GraphQLNullable<BillingAddressInput>(billingAddress!.toBillingAddressInput()) : nil

        let company = company != nil ? GraphQLNullable<CompanyInput>(company!.toCompanyInput()) : nil
        
        let shippingAddress = shippingAddress != nil ? GraphQLNullable<ShippingAddressInput>(shippingAddress!.asDTO) : nil

        return VaultCustomerInput(
            id: id?.toGraphQLNullable() ?? nil,
            billingAddress: billing,
            description: description?.toGraphQLNullable() ?? nil,
            email: email?.toGraphQLNullable() ?? nil,
            name: name?.toGraphQLNullable() ?? nil,
            phone: phone?.toGraphQLNullable() ?? nil,
            shippingAddress: shippingAddress,
            company: company
        )
    }
}
