// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension CheckoutSchema {
  class StartIntentMutation: GraphQLMutation {
    public static let operationName: String = "startIntent"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation startIntent($trackingId: ID!, $paymentFlowId: ID!, $customer: IntentCustomerInput, $amount: IntentAmountInput!, $location: IntentLocationInput, $cart: IntentCartInput) {
          startIntent(
            trackingId: $trackingId
            paymentFlowId: $paymentFlowId
            customer: $customer
            amount: $amount
            location: $location
            cart: $cart
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
            cart {
              __typename
              id
              weight
              itemCount
              items {
                __typename
                id
                quantity
                title
                variantTitle
                weight
                taxable
                requiresShipping
                price
                sku
                lineTotal
                image
                discountedPrice
                totalDiscount
              }
            }
          }
        }
        """
      ))

    public var trackingId: ID
    public var paymentFlowId: ID
    public var customer: GraphQLNullable<IntentCustomerInput>
    public var amount: IntentAmountInput
    public var location: GraphQLNullable<IntentLocationInput>
    public var cart: GraphQLNullable<IntentCartInput>

    public init(
      trackingId: ID,
      paymentFlowId: ID,
      customer: GraphQLNullable<IntentCustomerInput>,
      amount: IntentAmountInput,
      location: GraphQLNullable<IntentLocationInput>,
      cart: GraphQLNullable<IntentCartInput>
    ) {
      self.trackingId = trackingId
      self.paymentFlowId = paymentFlowId
      self.customer = customer
      self.amount = amount
      self.location = location
      self.cart = cart
    }

    public var __variables: Variables? { [
      "trackingId": trackingId,
      "paymentFlowId": paymentFlowId,
      "customer": customer,
      "amount": amount,
      "location": location,
      "cart": cart
    ] }

    public struct Data: CheckoutSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { CheckoutSchema.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("startIntent", StartIntent.self, arguments: [
          "trackingId": .variable("trackingId"),
          "paymentFlowId": .variable("paymentFlowId"),
          "customer": .variable("customer"),
          "amount": .variable("amount"),
          "location": .variable("location"),
          "cart": .variable("cart")
        ]),
      ] }

      public var startIntent: StartIntent { __data["startIntent"] }

      /// StartIntent
      ///
      /// Parent Type: `IntentApi`
      public struct StartIntent: CheckoutSchema.SelectionSet {
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
          .field("cart", Cart?.self),
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
        public var cart: Cart? { __data["cart"] }

        /// StartIntent.Amount
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

        /// StartIntent.Location
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

        /// StartIntent.Customer
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

        /// StartIntent.Timeline
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

          /// StartIntent.Timeline.IntentStarted
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

          /// StartIntent.Timeline.Shipping
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

          /// StartIntent.Timeline.Delivery
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

          /// StartIntent.Timeline.Billing
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

          /// StartIntent.Timeline.PaymentAttempt
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

          /// StartIntent.Timeline.CompleteIntent
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

        /// StartIntent.LinkedPayment
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

        /// StartIntent.Cart
        ///
        /// Parent Type: `IntentCart`
        public struct Cart: CheckoutSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { CheckoutSchema.Objects.IntentCart }
          public static var __selections: [Selection] { [
            .field("id", String.self),
            .field("weight", Int.self),
            .field("itemCount", Int.self),
            .field("items", [Item]?.self),
          ] }

          public var id: String { __data["id"] }
          public var weight: Int { __data["weight"] }
          public var itemCount: Int { __data["itemCount"] }
          public var items: [Item]? { __data["items"] }

          /// StartIntent.Cart.Item
          ///
          /// Parent Type: `IntentCartItemType`
          public struct Item: CheckoutSchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { CheckoutSchema.Objects.IntentCartItemType }
            public static var __selections: [Selection] { [
              .field("id", String?.self),
              .field("quantity", Int.self),
              .field("title", String.self),
              .field("variantTitle", String?.self),
              .field("weight", Int.self),
              .field("taxable", Bool.self),
              .field("requiresShipping", Bool.self),
              .field("price", Long.self),
              .field("sku", String.self),
              .field("lineTotal", Long.self),
              .field("image", String.self),
              .field("discountedPrice", Long.self),
              .field("totalDiscount", Long.self),
            ] }

            public var id: String? { __data["id"] }
            public var quantity: Int { __data["quantity"] }
            public var title: String { __data["title"] }
            public var variantTitle: String? { __data["variantTitle"] }
            public var weight: Int { __data["weight"] }
            public var taxable: Bool { __data["taxable"] }
            public var requiresShipping: Bool { __data["requiresShipping"] }
            public var price: Long { __data["price"] }
            public var sku: String { __data["sku"] }
            public var lineTotal: Long { __data["lineTotal"] }
            public var image: String { __data["image"] }
            public var discountedPrice: Long { __data["discountedPrice"] }
            public var totalDiscount: Long { __data["totalDiscount"] }
          }
        }
      }
    }
  }

}