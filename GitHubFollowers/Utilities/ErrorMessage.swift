//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-07.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "Data received from the server is invalid. Please try again."
    case noError = "No error occurred."
}

