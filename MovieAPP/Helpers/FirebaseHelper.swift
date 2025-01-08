//
//  FirebaseHelper.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 07.01.25.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

class FirebaseHelper {
    static let shared = FirebaseHelper()
    private let db = Firestore.firestore()
    
    private init() {}
    
    // MARK: - Authentication
    
    /// Register a user with email and password
    func registerUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }
    
    /// Login a user with email and password
    func loginUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }
    
    /// Log out the current user
    func logoutUser(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
    
    // MARK: - Firestore
//
//    /// Save data to a Firestore collection
//    func saveData(collection: String, documentID: String, data: [String: Any], completion: @escaping (Result<Void, Error>) -> Void) {
//        db.collection(collection).document(documentID).setData(data) { error in
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                completion(.success(()))
//            }
//        }
//    }
}
