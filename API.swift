//  This file was automatically generated and should not be edited.

import AWSAppSync

public final class PutPostMutation: GraphQLMutation {
  public static let operationString =
    "mutation PutPost($id: ID!, $title: String!) {\n  putPost(id: $id, title: $title)\n}"

  public var id: GraphQLID
  public var title: String

  public init(id: GraphQLID, title: String) {
    self.id = id
    self.title = title
  }

  public var variables: GraphQLMap? {
    return ["id": id, "title": title]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("putPost", arguments: ["id": GraphQLVariable("id"), "title": GraphQLVariable("title")], type: .list(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(putPost: [String?]? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "putPost": putPost])
    }

    public var putPost: [String?]? {
      get {
        return snapshot["putPost"] as? [String?]
      }
      set {
        snapshot.updateValue(newValue, forKey: "putPost")
      }
    }
  }
}

public final class GetBillQuery: GraphQLQuery {
  public static let operationString =
    "query GetBill($placeHolder: String) {\n  getBill(placeHolder: $placeHolder) {\n    __typename\n    billAmount\n    billID\n    billPatient\n    billReason\n    insuranceName\n  }\n}"

  public var placeHolder: String?

  public init(placeHolder: String? = nil) {
    self.placeHolder = placeHolder
  }

  public var variables: GraphQLMap? {
    return ["placeHolder": placeHolder]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getBill", arguments: ["placeHolder": GraphQLVariable("placeHolder")], type: .list(.object(GetBill.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getBill: [GetBill?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "getBill": getBill.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var getBill: [GetBill?]? {
      get {
        return (snapshot["getBill"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { GetBill(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "getBill")
      }
    }

    public struct GetBill: GraphQLSelectionSet {
      public static let possibleTypes = ["Bill"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("billAmount", type: .scalar(Double.self)),
        GraphQLField("billID", type: .scalar(String.self)),
        GraphQLField("billPatient", type: .scalar(String.self)),
        GraphQLField("billReason", type: .scalar(String.self)),
        GraphQLField("insuranceName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(billAmount: Double? = nil, billId: String? = nil, billPatient: String? = nil, billReason: String? = nil, insuranceName: String? = nil) {
        self.init(snapshot: ["__typename": "Bill", "billAmount": billAmount, "billID": billId, "billPatient": billPatient, "billReason": billReason, "insuranceName": insuranceName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var billAmount: Double? {
        get {
          return snapshot["billAmount"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "billAmount")
        }
      }

      public var billId: String? {
        get {
          return snapshot["billID"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "billID")
        }
      }

      public var billPatient: String? {
        get {
          return snapshot["billPatient"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "billPatient")
        }
      }

      public var billReason: String? {
        get {
          return snapshot["billReason"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "billReason")
        }
      }

      public var insuranceName: String? {
        get {
          return snapshot["insuranceName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "insuranceName")
        }
      }
    }
  }
}

public final class GetConsultationQuery: GraphQLQuery {
  public static let operationString =
    "query GetConsultation($placeHolder: String) {\n  getConsultation(placeHolder: $placeHolder) {\n    __typename\n    consultationID\n    consultationPrognosis\n    patientFirstName\n    patientLastName\n    symptoms\n    time\n  }\n}"

  public var placeHolder: String?

  public init(placeHolder: String? = nil) {
    self.placeHolder = placeHolder
  }

  public var variables: GraphQLMap? {
    return ["placeHolder": placeHolder]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getConsultation", arguments: ["placeHolder": GraphQLVariable("placeHolder")], type: .list(.object(GetConsultation.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getConsultation: [GetConsultation?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "getConsultation": getConsultation.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var getConsultation: [GetConsultation?]? {
      get {
        return (snapshot["getConsultation"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { GetConsultation(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "getConsultation")
      }
    }

    public struct GetConsultation: GraphQLSelectionSet {
      public static let possibleTypes = ["Consultation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("consultationID", type: .scalar(String.self)),
        GraphQLField("consultationPrognosis", type: .scalar(String.self)),
        GraphQLField("patientFirstName", type: .scalar(String.self)),
        GraphQLField("patientLastName", type: .scalar(String.self)),
        GraphQLField("symptoms", type: .scalar(String.self)),
        GraphQLField("time", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(consultationId: String? = nil, consultationPrognosis: String? = nil, patientFirstName: String? = nil, patientLastName: String? = nil, symptoms: String? = nil, time: String? = nil) {
        self.init(snapshot: ["__typename": "Consultation", "consultationID": consultationId, "consultationPrognosis": consultationPrognosis, "patientFirstName": patientFirstName, "patientLastName": patientLastName, "symptoms": symptoms, "time": time])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var consultationId: String? {
        get {
          return snapshot["consultationID"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "consultationID")
        }
      }

      public var consultationPrognosis: String? {
        get {
          return snapshot["consultationPrognosis"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "consultationPrognosis")
        }
      }

      public var patientFirstName: String? {
        get {
          return snapshot["patientFirstName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "patientFirstName")
        }
      }

      public var patientLastName: String? {
        get {
          return snapshot["patientLastName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "patientLastName")
        }
      }

      public var symptoms: String? {
        get {
          return snapshot["symptoms"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "symptoms")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }
    }
  }
}

public final class GetPatientsQuery: GraphQLQuery {
  public static let operationString =
    "query GetPatients($placeHolder: String) {\n  getPatients(placeHolder: $placeHolder) {\n    __typename\n    CIN\n    address\n    chronicDiseases\n    dob\n    emergencyContact\n    firstName\n    lastName\n    maritalStatus\n    patientID\n    phoneNumber\n    placeOfBirth\n  }\n}"

  public var placeHolder: String?

  public init(placeHolder: String? = nil) {
    self.placeHolder = placeHolder
  }

  public var variables: GraphQLMap? {
    return ["placeHolder": placeHolder]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getPatients", arguments: ["placeHolder": GraphQLVariable("placeHolder")], type: .list(.object(GetPatient.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getPatients: [GetPatient?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "getPatients": getPatients.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var getPatients: [GetPatient?]? {
      get {
        return (snapshot["getPatients"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { GetPatient(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "getPatients")
      }
    }

    public struct GetPatient: GraphQLSelectionSet {
      public static let possibleTypes = ["Patient"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("CIN", type: .scalar(String.self)),
        GraphQLField("address", type: .scalar(String.self)),
        GraphQLField("chronicDiseases", type: .scalar(String.self)),
        GraphQLField("dob", type: .scalar(String.self)),
        GraphQLField("emergencyContact", type: .scalar(String.self)),
        GraphQLField("firstName", type: .scalar(String.self)),
        GraphQLField("lastName", type: .scalar(String.self)),
        GraphQLField("maritalStatus", type: .scalar(String.self)),
        GraphQLField("patientID", type: .scalar(String.self)),
        GraphQLField("phoneNumber", type: .scalar(String.self)),
        GraphQLField("placeOfBirth", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(cin: String? = nil, address: String? = nil, chronicDiseases: String? = nil, dob: String? = nil, emergencyContact: String? = nil, firstName: String? = nil, lastName: String? = nil, maritalStatus: String? = nil, patientId: String? = nil, phoneNumber: String? = nil, placeOfBirth: String? = nil) {
        self.init(snapshot: ["__typename": "Patient", "CIN": cin, "address": address, "chronicDiseases": chronicDiseases, "dob": dob, "emergencyContact": emergencyContact, "firstName": firstName, "lastName": lastName, "maritalStatus": maritalStatus, "patientID": patientId, "phoneNumber": phoneNumber, "placeOfBirth": placeOfBirth])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cin: String? {
        get {
          return snapshot["CIN"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "CIN")
        }
      }

      public var address: String? {
        get {
          return snapshot["address"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "address")
        }
      }

      public var chronicDiseases: String? {
        get {
          return snapshot["chronicDiseases"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "chronicDiseases")
        }
      }

      public var dob: String? {
        get {
          return snapshot["dob"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dob")
        }
      }

      public var emergencyContact: String? {
        get {
          return snapshot["emergencyContact"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "emergencyContact")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["firstName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["lastName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "lastName")
        }
      }

      public var maritalStatus: String? {
        get {
          return snapshot["maritalStatus"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "maritalStatus")
        }
      }

      public var patientId: String? {
        get {
          return snapshot["patientID"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "patientID")
        }
      }

      public var phoneNumber: String? {
        get {
          return snapshot["phoneNumber"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "phoneNumber")
        }
      }

      public var placeOfBirth: String? {
        get {
          return snapshot["placeOfBirth"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "placeOfBirth")
        }
      }
    }
  }
}