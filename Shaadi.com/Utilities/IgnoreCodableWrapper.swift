//
//  Wrapper.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//

@propertyWrapper
struct IgnoreCodable<T> {
    var wrappedValue: T

    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

extension IgnoreCodable: Encodable where T: Encodable {
    func encode(to encoder: Encoder) throws {
        // Do nothing: This property won't be encoded
    }
}

extension IgnoreCodable: Decodable where T: Decodable {
    init(from decoder: Decoder) throws {
        // Do nothing: This property won't be decoded
        self.init(wrappedValue: T.self as! T)
    }
}
