//
// PetAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class PetAPI {
    private let transport: OpenAPITransport
    public var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(OpenISO8601DateFormatter())
        return encoder
    }()
    public var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(OpenISO8601DateFormatter())
        return decoder
    }()
    public var baseURL = URL(string: "http://petstore.swagger.io/v2")

    public init(_ transport: OpenAPITransport) {
        self.transport = transport
    }

    public enum AddPetError: Error, CustomStringConvertible {
        // Invalid input
        case code405Error

        public var description: String {
            switch self {
            case .code405Error:
                return "AddPetError: Invalid input"
            }
        }
    }

    /// Add a new pet to the store
    /// - POST /pet
    /// - 
    /// - OAuth:
    /// - type: oauth2
    /// - name: petstore_auth
    /// - parameter pet: (body) Pet object that needs to be added to the store 
    /// - returns: AnyPublisher<Pet, Error> 
    open func addPet(pet: Pet) -> AnyPublisher<Pet, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/pet"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(pet)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Pet, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 405 {
                        return AddPetError.code405Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(Pet.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum DeletePetError: Error, CustomStringConvertible {
        // Invalid pet value
        case code400Error

        public var description: String {
            switch self {
            case .code400Error:
                return "DeletePetError: Invalid pet value"
            }
        }
    }

    /// Deletes a pet
    /// - DELETE /pet/{petId}
    /// - 
    /// - OAuth:
    /// - type: oauth2
    /// - name: petstore_auth
    /// - parameter petId: (path) Pet id to delete 
    /// - parameter apiKey: (header)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func deletePet(petId: Int64, apiKey: String? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/pet/{petId}"
                path = path.replacingOccurrences(of: "{petId}", with: "\(petId)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "DELETE"
                var headers = [String: String]()
                if let apiKey = apiKey { headers["api_key"] = apiKey }
                request.allHTTPHeaderFields = headers
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return DeletePetError.code400Error
                    }
                    return transportError
                }
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    ///
    /// Enum for parameter status
    ///
    public enum FindPetsByStatusStatus: String, Codable, CaseIterable {
        case available = "available"
        case pending = "pending"
        case sold = "sold"
    }
    public enum FindPetsByStatusError: Error, CustomStringConvertible {
        // Invalid status value
        case code400Error

        public var description: String {
            switch self {
            case .code400Error:
                return "FindPetsByStatusError: Invalid status value"
            }
        }
    }

    /// Finds Pets by status
    /// - GET /pet/findByStatus
    /// - Multiple status values can be provided with comma separated strings
    /// - OAuth:
    /// - type: oauth2
    /// - name: petstore_auth
    /// - parameter status: (query) Status values that need to be considered for filter 
    /// - returns: AnyPublisher<[Pet], Error> 
    open func findPetsByStatus(status: [FindPetsByStatusStatus]) -> AnyPublisher<[Pet], Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/pet/findByStatus"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                queryItems.append(URLQueryItem(name: "status", value: status.map { $0.rawValue }.joined(separator: ",")))
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<[Pet], Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return FindPetsByStatusError.code400Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode([Pet].self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum FindPetsByTagsError: Error, CustomStringConvertible {
        // Invalid tag value
        case code400Error

        public var description: String {
            switch self {
            case .code400Error:
                return "FindPetsByTagsError: Invalid tag value"
            }
        }
    }

    /// Finds Pets by tags
    /// - GET /pet/findByTags
    /// - Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
    /// - OAuth:
    /// - type: oauth2
    /// - name: petstore_auth
    /// - parameter tags: (query) Tags to filter by 
    /// - returns: AnyPublisher<[Pet], Error> 
    @available(*, deprecated, message: "Deprecated API operation")
    open func findPetsByTags(tags: [String]) -> AnyPublisher<[Pet], Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/pet/findByTags"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                queryItems.append(URLQueryItem(name: "tags", value: tags.joined(separator: ",")))
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<[Pet], Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return FindPetsByTagsError.code400Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode([Pet].self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum GetPetByIdError: Error, CustomStringConvertible {
        // Invalid ID supplied
        case code400Error
        // Pet not found
        case code404Error

        public var description: String {
            switch self {
            case .code400Error:
                return "GetPetByIdError: Invalid ID supplied"
            case .code404Error:
                return "GetPetByIdError: Pet not found"
            }
        }
    }

    /// Find pet by ID
    /// - GET /pet/{petId}
    /// - Returns a single pet
    /// - API Key:
    /// - type: apiKey api_key 
    /// - name: api_key
    /// - parameter petId: (path) ID of pet to return 
    /// - returns: AnyPublisher<Pet, Error> 
    open func getPetById(petId: Int64) -> AnyPublisher<Pet, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/pet/{petId}"
                path = path.replacingOccurrences(of: "{petId}", with: "\(petId)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Pet, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return GetPetByIdError.code400Error
                    }
                    if transportError.statusCode == 404 {
                        return GetPetByIdError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(Pet.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum UpdatePetError: Error, CustomStringConvertible {
        // Invalid ID supplied
        case code400Error
        // Pet not found
        case code404Error
        // Validation exception
        case code405Error

        public var description: String {
            switch self {
            case .code400Error:
                return "UpdatePetError: Invalid ID supplied"
            case .code404Error:
                return "UpdatePetError: Pet not found"
            case .code405Error:
                return "UpdatePetError: Validation exception"
            }
        }
    }

    /// Update an existing pet
    /// - PUT /pet
    /// - 
    /// - OAuth:
    /// - type: oauth2
    /// - name: petstore_auth
    /// - externalDocs:
    ///     url: http://petstore.swagger.io/v2/doc/updatePet 
    ///     description: API documentation for the updatePet operation 
    /// - parameter pet: (body) Pet object that needs to be added to the store 
    /// - returns: AnyPublisher<Pet, Error> 
    open func updatePet(pet: Pet) -> AnyPublisher<Pet, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/pet"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                request.httpBody = try self.encoder.encode(pet)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Pet, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return UpdatePetError.code400Error
                    }
                    if transportError.statusCode == 404 {
                        return UpdatePetError.code404Error
                    }
                    if transportError.statusCode == 405 {
                        return UpdatePetError.code405Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(Pet.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum UpdatePetWithFormError: Error, CustomStringConvertible {
        // Invalid input
        case code405Error

        public var description: String {
            switch self {
            case .code405Error:
                return "UpdatePetWithFormError: Invalid input"
            }
        }
    }

    /// Updates a pet in the store with form data
    /// - POST /pet/{petId}
    /// - 
    /// - OAuth:
    /// - type: oauth2
    /// - name: petstore_auth
    /// - parameter petId: (path) ID of pet that needs to be updated 
    /// - parameter name: (form) Updated name of the pet (optional)
    /// - parameter status: (form) Updated status of the pet (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func updatePetWithForm(petId: Int64, name: String? = nil, status: String? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/pet/{petId}"
                path = path.replacingOccurrences(of: "{petId}", with: "\(petId)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                var formEncodedItems: [String] = []
                if let name = name { formEncodedItems.append("name=\(name)") } 
                if let status = status { formEncodedItems.append("status=\(status)") } 
                request.httpBody = formEncodedItems.joined(separator: "&").data(using: .utf8)
                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 405 {
                        return UpdatePetWithFormError.code405Error
                    }
                    return transportError
                }
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// uploads an image
    /// - POST /pet/{petId}/uploadImage
    /// - 
    /// - OAuth:
    /// - type: oauth2
    /// - name: petstore_auth
    /// - parameter petId: (path) ID of pet to update 
    /// - parameter additionalMetadata: (form) Additional data to pass to server (optional)
    /// - parameter file: (form) file to upload (optional)
    /// - returns: AnyPublisher<ApiResponse, Error> 
    open func uploadFile(petId: Int64, additionalMetadata: String? = nil, file: Data? = nil) -> AnyPublisher<ApiResponse, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/pet/{petId}/uploadImage"
                path = path.replacingOccurrences(of: "{petId}", with: "\(petId)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                let multipartBoundary = String(format: "Boundary+%08X%08X", arc4random(), arc4random())
                var multipartData = Data()
				if let additionalMetadata = additionalMetadata {
					let additionalMetadataHeader = "--\(multipartBoundary)\r\n"
					    .appending("Content-Disposition:form-data; name=\"additionalMetadata\"\r\n")
					    .appending("\r\n")
					multipartData.append(additionalMetadataHeader.data(using: .utf8) ?? Data())
					multipartData.append(additionalMetadata.data(using: .utf8) ?? Data())
					multipartData.append("\r\n".data(using: .utf8) ?? Data())
				}

				if let file = file {
					let fileHeader = "--\(multipartBoundary)\r\n"
					    .appending("Content-Disposition:form-data; name=\"file\"; filename=\"file\"\r\n")
					    .appending("\r\n")
					multipartData.append(fileHeader.data(using: .utf8) ?? Data())
					multipartData.append(file)
				}

                multipartData.append("\r\n--\(multipartBoundary)--\r\n".data(using: .utf8) ?? Data())
                request.httpBody = multipartData
                request.setValue("\(multipartData.count)", forHTTPHeaderField: "Content-Length")
                request.setValue("multipart/form-data; boundary=\(multipartBoundary)", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<ApiResponse, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(ApiResponse.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}