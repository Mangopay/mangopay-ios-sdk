//
//  File.swift
//  
//
//  Created by Elikem Savie on 01/08/2023.
//

import Foundation

public protocol PaymentCoreClientProtocol {
    func createCardRegistration(
        _ card: MGPCardRegistration.Initiate,
        clientId: String,
        apiKey: String
    ) async throws -> MGPCardRegistration
    func postCardInfo(_ cardInfo: MGPCardInfo, url: URL) async throws -> MGPCardInfo.RegistrationData
    func updateCardInfo(_ regData: MGPCardInfo.RegistrationData, clientId: String, cardRegistrationId: String) async throws -> MGPCardRegistration
    func authorizePayIn(_ authorizeData: AuthorizePayIn, clientId: String, apiKey: String) async throws -> AuthorizePayIn
    func getPayIn(clientId: String, apiKey: String, payInId: String) async throws -> PayIn
    func fetchPayInCards(clientId: String, apiKey: String, userId: String, active: Bool) async throws -> [PayInCard]
    func createPreAuth(clientId: String, apiKey: String, preAuth: PreAuthCard) async throws -> PreAuthCard
    func viewPreAuth(clientId: String, apiKey: String, preAuthId: String) async throws -> PreAuthCard
}

public final class PaymentCoreClient: NetworkUtil, PaymentCoreClientProtocol {
    
    var baseUrl: URL!

    public init(env: MGPEnvironment) {
        self.baseUrl = env.url
    }

    public func createCardRegistration(
        _ card: MGPCardRegistration.Initiate,
        clientId: String,
        apiKey: String
    ) async throws -> MGPCardRegistration {

        let url = baseUrl.appendingPathComponent(
            "/\(apiVersion)/\(clientId)/cardregistrations",
            isDirectory: false
        )

        return try await request(
            url: url,
            method: .post,
            additionalHeaders: [
                "Content-Type" : "application/json",
            ],
            bodyParam: card.toDict(),
            expecting: MGPCardRegistration.self,
            basicAuthDict: [
                "Username" : clientId,
                "Password": apiKey
            ],
            verbose: true
        )
    }
    
    public func postCardInfo(_ cardInfo: MGPCardInfo, url: URL) async throws -> MGPCardInfo.RegistrationData {

        return try await request(
            url: url,
            method: .post,
            additionalHeaders: [
                "Content-Type" : "application/x-www-form-urlencoded",
            ],
            bodyParam: cardInfo.toDict(),
            expecting: MGPCardInfo.RegistrationData.self,
            verbose: true,
            useXXForm: true,
            decodeAsString: true
        )
    }

    public func updateCardInfo(
        _ regData: MGPCardInfo.RegistrationData,
        clientId: String,
        cardRegistrationId: String) async throws -> MGPCardRegistration {
        
        let url = baseUrl.appendingPathComponent(
            "/\(apiVersion)/\(clientId)/CardRegistrations/\(cardRegistrationId)",
            isDirectory: false
        )

        return try await request(
            url: url,
            method: .put,
            additionalHeaders: [
                "Content-Type" : "application/json",
            ],
            bodyParam: regData.toDict(),
            expecting: MGPCardRegistration.self,
            verbose: true
        )
    }

    public func authorizePayIn(
        _ authorizeData: AuthorizePayIn,
        clientId: String,
        apiKey: String
    ) async throws -> AuthorizePayIn {

        let url = baseUrl.appendingPathComponent(
            "/\(apiVersion)/\(clientId)/payins/card/direct",
            isDirectory: false
        )

        return try await request(
            url: url,
            method: .post,
            additionalHeaders: [
                "Content-Type" : "application/json",
            ],
            bodyParam: authorizeData.toDict(),
            expecting: AuthorizePayIn.self,
            basicAuthDict: [
                "Username" : clientId,
                "Password": apiKey
            ],
            verbose: true
        )
    }

    public func getPayIn(clientId: String, apiKey: String, payInId: String) async throws -> PayIn {
        let url = baseUrl.appendingPathComponent(
            "/\(apiVersion)/\(clientId)/payins/\(payInId)",
            isDirectory: false
        )

        return try await request(
            url: url,
            method: .get,
            additionalHeaders: [
                "Content-Type" : "application/json",
            ],
            bodyParam: nil,
            expecting: PayIn.self,
            basicAuthDict: [
                "Username" : clientId,
                "Password": apiKey
            ],
            verbose: true
        )
    }

    public func fetchPayInCards(clientId: String, apiKey: String, userId: String, active: Bool) async throws -> [PayInCard] {
        let url = baseUrl.appendingPathComponent(
            "/\(apiVersion)/\(clientId)/users/\(userId)/cards",
            isDirectory: false
        )

        return try await request(
            url: url,
            method: .get,
            additionalHeaders: [
                "Content-Type" : "application/json",
            ],
            bodyParam: nil,
            queryParam: ["Active": active],
            expecting: [PayInCard].self,
            basicAuthDict: [
                "Username" : clientId,
                "Password": apiKey
            ],
            verbose: true
        )
    }

    public func createPreAuth(clientId: String, apiKey: String, preAuth: PreAuthCard) async throws -> PreAuthCard {
        let url = baseUrl.appendingPathComponent(
            "/\(apiVersion)/\(clientId)/preauthorizations/card/direct",
            isDirectory: false
        )

        return try await request(
            url: url,
            method: .post,
            additionalHeaders: [
                "Content-Type" : "application/json",
            ],
            bodyParam: preAuth.toDict(),
            expecting: PreAuthCard.self,
            basicAuthDict: [
                "Username" : clientId,
                "Password": apiKey
            ],
            verbose: true
        )
    }

    public func viewPreAuth(clientId: String, apiKey: String, preAuthId: String) async throws -> PreAuthCard {
        let url = baseUrl.appendingPathComponent(
            "/\(apiVersion)/\(clientId)/preauthorizations/\(preAuthId)",
            isDirectory: false
        )

        return try await request(
            url: url,
            method: .get,
            additionalHeaders: [
                "Content-Type" : "application/json",
            ],
            expecting: PreAuthCard.self,
            basicAuthDict: [
                "Username" : clientId,
                "Password": apiKey
            ],
            verbose: true
        )
    }
}