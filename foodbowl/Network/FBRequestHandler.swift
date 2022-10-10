//
//  RequestHandler.swift
//  foodbowl
//
//  Created by Spencer Hartland on 10/8/22.
//

import Foundation

public struct FBRequest {
    private static let baseURL = "http://foodbowl.local"
    private static let connectionTestPathComponent = "/connection-test"
    private static let dispensePathComponent = "/dispense"
    private static let ledOnPathComponent = "/led-on"
    private static let ledOffPathComponent = "/led-off"
    private static let httpGETMethod = "GET"
    
    private static func requestURL(path: String) -> URL? {
        let urlString = baseURL + path
        guard let url = URL(string: urlString) else {
            print("Unable to create URL from FBRequest.baseURL")
            return nil
        }
        return url
    }
    
    private static func dispenseRequestURL(value: String) -> URL? {
        guard var components = URLComponents(string: baseURL) else {
            print("Unable to create URLComponents from FBRequest.baseURL")
            return nil
        }
        components.path = dispensePathComponent
        components.queryItems = [
            URLQueryItem(name: "revolutions", value: value)
        ]
        guard let url = components.url else {
            print("Unable to get URL from URLComponents")
            return nil
        }
        print(url.absoluteString)
        return url
    }
    
    private static func ledRequestURL(r: String, g: String, b: String) -> URL? {
        guard var components = URLComponents(string: baseURL) else {
            print("Unable to create URLComponents from FBRequest.baseURL")
            return nil
        }
        components.path = ledOnPathComponent
        components.queryItems = [
            URLQueryItem(name: "r", value: r),
            URLQueryItem(name: "g", value: g),
            URLQueryItem(name: "b", value: b)
        ]
        guard let url = components.url else {
            print("Unable to get URL from URLComponents")
            return nil
        }
        print(url.absoluteString)
        return url
    }
    
    fileprivate static func connectionTestRequest() -> URLRequest? {
        guard let url = requestURL(path: FBRequest.connectionTestPathComponent) else {
            print("Error while unwrapping url from dispenseURL()")
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = FBRequest.httpGETMethod
        return request
    }
    
    fileprivate static func quickDispenseRequest() -> URLRequest? {
        guard let url = requestURL(path: FBRequest.dispensePathComponent) else {
            print("Error while unwrapping url from dispenseURL()")
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = FBRequest.httpGETMethod
        return request
    }
    
    fileprivate static func fullDispenseRequest(value: String) -> URLRequest? {
        guard let url = dispenseRequestURL(value: value) else {
            print("Error while unwrapping url from dispenseURL()")
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = FBRequest.httpGETMethod
        return request
    }
    
    fileprivate static func ledOnRequest() -> URLRequest? {
        guard let url = requestURL(path: FBRequest.ledOnPathComponent) else {
            print("Error while unwrapping url from dispenseURL()")
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = FBRequest.httpGETMethod
        return request
    }
    
    fileprivate static func ledSetColorRequest(r: String, g: String, b: String) -> URLRequest? {
        guard let url = ledRequestURL(r: r, g: g, b: b) else {
            print("Error while unwrapping url from dispenseURL()")
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = FBRequest.httpGETMethod
        return request
    }
    
    fileprivate static func ledOffRequest() -> URLRequest? {
        guard let url = requestURL(path: FBRequest.ledOffPathComponent) else {
            print("Error while unwrapping url from dispenseURL()")
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = FBRequest.httpGETMethod
        return request
    }
}

public struct FBRequestHandler {
    private func handle(_ request: URLRequest, completion: @escaping (Bool) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let httpResponse = response as? HTTPURLResponse,
                  (200 ..< 300).contains(httpResponse.statusCode),
                  let responseData = data
            else {
                completion(false)
                return
            }
            let decodedResponse = String(decoding: responseData, as: UTF8.self)
            print(decodedResponse)
            completion(true)
        }.resume()
    }
    
    public func testConnection(completion: @escaping (Bool) -> Void) {
        guard let request = FBRequest.connectionTestRequest() else {
            completion(false)
            return
        }
        handle(request, completion: completion)
    }
    
    public func dispenseFood(value: String, completion: @escaping (Bool) -> Void) {
        guard let request = FBRequest.fullDispenseRequest(value: value) else {
            completion(false)
            return
        }
        handle(request, completion: completion)
    }
    
    public func quickDispense(completion: @escaping (Bool) -> Void) {
        guard let request = FBRequest.quickDispenseRequest() else {
            completion(false)
            return
        }
        handle(request, completion: completion)
    }
    
    public func setLEDColor(r: String, g: String, b: String, completion: @escaping (Bool) -> Void) {
        guard let request = FBRequest.ledSetColorRequest(r: r, g: g, b: b) else {
            completion(false)
            return
        }
        handle(request, completion: completion)
    }
    
    public func turnOnLED(completion: @escaping (Bool) -> Void) {
        guard let request = FBRequest.ledOnRequest() else {
            completion(false)
            return
        }
        handle(request, completion: completion)
    }
    
    public func turnOffLED(completion: @escaping (Bool) -> Void) {
        guard let request = FBRequest.ledOffRequest() else {
            completion(false)
            return
        }
        handle(request, completion: completion)
    }
}
