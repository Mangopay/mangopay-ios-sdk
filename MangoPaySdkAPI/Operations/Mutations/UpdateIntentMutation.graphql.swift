// @generated
// This file was automatically generated and should not be edited.

#if !COCOAPODS
@_exported import ApolloAPI
#else
import Apollo
#endif

public extension CheckoutSchema {
  class UpdateIntentMutation: GraphQLMutation {
    public static let operationName: String = "updateIntent"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation updateIntent($id: ID!, $trackingId: String, $customer: IntentCustomerInput, $amount: IntentAmountInput, $shipping: IntentShippingInput, $delivery: IntentDeliveryInput, $billing: IntentShippingInput, $location: IntentLocationInput) {
          updateIntent(
            id: $id
            trackingId: $trackingId
            customer: $customer
            amount: $amount
            shipping: $shipping
            delivery: $delivery
            billing: $billing
            location: $location
          ) {
            __typename
            id
            trackingId
            paymentFlowId
            status
            statusDate
            date
            currency
            amount {
              __typename
              formattedAmount
            }
            location {
              __typename
              country
            }
            customer {
              __typename
              id
              isGuest
            }
            timeline {
              __typename
              intentStarted {
                __typename
                status
                date
              }
              shipping {
                __typename
                status
                date
              }
              delivery {
                __typename
                status
                date
              }
              billing {
                __typename
                status
                date
              }
              paymentAttempts {
                __typename
                status
                date
              }
              completeIntent {
                __typename
                status
                date
              }
            }
            linkedPayments {
              __typename
              paymentId
              status
              time
              title
            }
          }
        }
        """
      ))

    public var id: ID
    public var trackingId: GraphQLNullable<String>
    public var customer: GraphQLNullable<IntentCustomerInput>
    public var amount: GraphQLNullable<IntentAmountInput>
    public var shipping: GraphQLNullable<IntentShippingInput>
    public var delivery: GraphQLNullable<IntentDeliveryInput>
    public var billing: GraphQLNullable<IntentShippingInput>
    public var location: GraphQLNullable<IntentLocationInput>

    public init(
      id: ID,
      trackingId: GraphQLNullable<String>,
      customer: GraphQLNullable<IntentCustomerInput>,
      amount: GraphQLNullable<IntentAmountInput>,
      shipping: GraphQLNullable<IntentShippingInput>,
      delivery: GraphQLNullable<IntentDeliveryInput>,
      billing: GraphQLNullable<IntentShippingInput>,
      location: GraphQLNullable<IntentLocationInput>
    ) {
      self.id = id
      self.trackingId = trackingId
      self.customer = customer
      self.amount = amount
      self.shipping = shipping
      self.delivery = delivery
      self.billing = billing
      self.location = location
    }

    public var __variables: Variables? { [
      "id": id,
      "trackingId": trackingId,
      "customer": customer,
      "amount": amount,
      "shipping": shipping,
      "delivery": delivery,
      "billing": billing,
      "location": location
    ] }

    public struct Data: CheckoutSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { CheckoutSchema.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("updateIntent", UpdateIntent.self, arguments: [
          "id": .variable("id"),
          "trackingId": .variable("trackingId"),
          "customer": .variable("customer"),
          "amount": .variable("amount"),
          "shipping": .variable("shipping"),
          "delivery": .variable("delivery"),
          "billing": .variable("billing"),
          "location": .variable("location")
        ]),
      ] }

      public var updateIntent: UpdateIntent { __data["updateIntent"] }

      /// UpdateIntent
      ///
      /// Parent Type: `IntentApi`
      public struct UpdateIntent: CheckoutSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { CheckoutSchema.Objects.IntentApi }
        public static var __selections: [Selection] { [
          .field("id", ID.self),
          .field("trackingId", String.self),
          .field("paymentFlowId", String.self),
          .field("status", GraphQLEnum<IntentStatus>?.self),
          .field("statusDate", DateTime?.self),
          .field("date", DateTime.self),
          .field("currency", String?.self),
          .field("amount", Amount?.self),
          .field("location", Location?.self),
          .field("customer", Customer?.self),
          .field("timeline", Timeline?.self),
          .field("linkedPayments", [LinkedPayment?]?.self),
        ] }

        public var id: ID { __data["id"] }
        public var trackingId: String { __data["trackingId"] }
        public var paymentFlowId: String { __data["paymentFlowId"] }
        public var status: GraphQLEnum<IntentStatus>? { __data["status"] }
        public var statusDate: DateTime? { __data["statusDate"] }
        public var date: DateTime { __data["date"] }
        public var currency: String? { __data["currency"] }
        public var amount: Amount? { __data["amount"] }
        public var location: Location? { __data["location"] }
        public var customer: Customer? { __data["customer"] }
        public var timeline: Timeline? { __data["timeline"] }
        public var linkedPayments: [LinkedPayment?]? { __data["linkedPayments"] }

        /// UpdateIntent.Amount
        ///
        /// Parent Type: `Amount`
        public struct Amount: CheckoutSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { CheckoutSchema.Objects.Amount }
          public static var __selections: [Selection] { [
            .field("formattedAmount", String.self),
          ] }

          public var formattedAmount: String { __data["formattedAmount"] }
        }

        /// UpdateIntent.Location
        ///
        /// Parent Type: `IntentLocation`
        public struct Location: CheckoutSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { CheckoutSchema.Objects.IntentLocation }
          public static var __selections: [Selection] { [
            .field("country", String?.self),
          ] }

          public var country: String? { __data["country"] }
        }

        /// UpdateIntent.Customer
        ///
        /// Parent Type: `IntentCustomer`
        public struct Customer: CheckoutSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { CheckoutSchema.Objects.IntentCustomer }
          public static var __selections: [Selection] { [
            .field("id", String?.self),
            .field("isGuest", Bool?.self),
          ] }

          public var id: String? { __data["id"] }
          public var isGuest: Bool? { __data["isGuest"] }
        }

        /// UpdateIntent.Timeline
        ///
        /// Parent Type: `IntentTimeline`
        public struct Timeline: CheckoutSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { CheckoutSchema.Objects.IntentTimeline }
          public static var __selections: [Selection] { [
            .field("intentStarted", IntentStarted?.self),
            .field("shipping", Shipping?.self),
            .field("delivery", Delivery?.self),
            .field("billing", Billing?.self),
            .field("paymentAttempts", [PaymentAttempt?]?.self),
            .field("completeIntent", CompleteIntent?.self),
          ] }

          public var intentStarted: IntentStarted? { __data["intentStarted"] }
          public var shipping: Shipping? { __data["shipping"] }
          public var delivery: Delivery? { __data["delivery"] }
          public var billing: Billing? { __data["billing"] }
          public var paymentAttempts: [PaymentAttempt?]? { __data["paymentAttempts"] }
          public var completeIntent: CompleteIntent? { __data["completeIntent"] }

          /// UpdateIntent.Timeline.IntentStarted
          ///
          /// Parent Type: `IntentTimelineStep`
          public struct IntentStarted: CheckoutSchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { CheckoutSchema.Objects.IntentTimelineStep }
            public static var __selections: [Selection] { [
              .field("status", GraphQLEnum<FormStepStatus>?.self),
              .field("date", DateTime?.self),
            ] }

            public var status: GraphQLEnum<FormStepStatus>? { __data["status"] }
            public var date: DateTime? { __data["date"] }
          }

          /// UpdateIntent.Timeline.Shipping
          ///
          /// Parent Type: `IntentTimelineStep`
          public struct Shipping: CheckoutSchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { CheckoutSchema.Objects.IntentTimelineStep }
            public static var __selections: [Selection] { [
              .field("status", GraphQLEnum<FormStepStatus>?.self),
              .field("date", DateTime?.self),
            ] }

            public var status: GraphQLEnum<FormStepStatus>? { __data["status"] }
            public var date: DateTime? { __data["date"] }
          }

          /// UpdateIntent.Timeline.Delivery
          ///
          /// Parent Type: `IntentTimelineStep`
          public struct Delivery: CheckoutSchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { CheckoutSchema.Objects.IntentTimelineStep }
            public static var __selections: [Selection] { [
              .field("status", GraphQLEnum<FormStepStatus>?.self),
              .field("date", DateTime?.self),
            ] }

            public var status: GraphQLEnum<FormStepStatus>? { __data["status"] }
            public var date: DateTime? { __data["date"] }
          }

          /// UpdateIntent.Timeline.Billing
          ///
          /// Parent Type: `IntentTimelineStep`
          public struct Billing: CheckoutSchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { CheckoutSchema.Objects.IntentTimelineStep }
            public static var __selections: [Selection] { [
              .field("status", GraphQLEnum<FormStepStatus>?.self),
              .field("date", DateTime?.self),
            ] }

            public var status: GraphQLEnum<FormStepStatus>? { __data["status"] }
            public var date: DateTime? { __data["date"] }
          }

          /// UpdateIntent.Timeline.PaymentAttempt
          ///
          /// Parent Type: `IntentTimelineStep`
          public struct PaymentAttempt: CheckoutSchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { CheckoutSchema.Objects.IntentTimelineStep }
            public static var __selections: [Selection] { [
              .field("status", GraphQLEnum<FormStepStatus>?.self),
              .field("date", DateTime?.self),
            ] }

            public var status: GraphQLEnum<FormStepStatus>? { __data["status"] }
            public var date: DateTime? { __data["date"] }
          }

          /// UpdateIntent.Timeline.CompleteIntent
          ///
          /// Parent Type: `IntentTimelineStep`
          public struct CompleteIntent: CheckoutSchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { CheckoutSchema.Objects.IntentTimelineStep }
            public static var __selections: [Selection] { [
              .field("status", GraphQLEnum<FormStepStatus>?.self),
              .field("date", DateTime?.self),
            ] }

            public var status: GraphQLEnum<FormStepStatus>? { __data["status"] }
            public var date: DateTime? { __data["date"] }
          }
        }

        /// UpdateIntent.LinkedPayment
        ///
        /// Parent Type: `LinkedPayment`
        public struct LinkedPayment: CheckoutSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { CheckoutSchema.Objects.LinkedPayment }
          public static var __selections: [Selection] { [
            .field("paymentId", String?.self),
            .field("status", GraphQLEnum<PaymentStatus>?.self),
            .field("time", DateTime?.self),
            .field("title", String?.self),
          ] }

          public var paymentId: String? { __data["paymentId"] }
          public var status: GraphQLEnum<PaymentStatus>? { __data["status"] }
          public var time: DateTime? { __data["time"] }
          public var title: String? { __data["title"] }
        }
      }
    }
  }

}
