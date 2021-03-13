//
//  MinaRestAPIDataManager.swift
//  MinaWallet
//
//  Created by Jeffrey Jackson on 3/12/21.
//

import Foundation

protocol MinaRestAPIDataManager {
    func getBlockchainSummary(_ complete:@escaping (Result<Blockchain, Error>) -> ())
    func getAccountDetails(_ publicKey: String, _ complete:@escaping (Result<Account, Error>) -> ())
    func getBlock(_ stateHash: String, _ complete:@escaping (Result<Block, Error>) -> ())
    func getBlocks(_ limit: Int?, _ complete:@escaping (Result<Blocks, Error>) -> ())
}

public class MinaRestAPIDataManagerImp : MinaRestAPIDataManager {
    static let shared : MinaRestAPIDataManager = {
        return MinaRestAPIDataManagerImp()
    }()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?

    func getBlockchainSummary(_ complete:@escaping (Result<Blockchain, Error>) -> ()) {
        let urlString = "https://api.minaexplorer.com/summary"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        dataTask?.cancel()
        
        dataTask = defaultSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                complete(.failure(error))
                return
            }
            guard let _ = response, let _ = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                complete(.failure(error))
                return
            }
            
            do {
                let blockchain = try JSONDecoder().decode(Blockchain.self, from: data!)
                complete(.success(blockchain))
            } catch (let error) {
                debugPrint(error)
                complete(.failure(error))
            }
        }
        
        dataTask?.resume()
    }
    
    func getAccountDetails(_ publicKey: String, _ complete: @escaping (Result<Account, Error>) -> ()) {
        let urlString = "https://api.minaexplorer.com/accounts/\(publicKey)"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        dataTask?.cancel()
        
        dataTask = defaultSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                complete(.failure(error))
                return
            }
            guard let _ = response, let _ = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                complete(.failure(error))
                return
            }
            
            do {
                let account = try JSONDecoder().decode(Account.self, from: data!)
                complete(.success(account))
            } catch (let error) {
                debugPrint(error)
                complete(.failure(error))
            }
        }
        
        dataTask?.resume()
    }
    
    func getBlock(_ stateHash: String, _ complete: @escaping (Result<Block, Error>) -> ()) {
        let urlString = "https://api.minaexplorer.com/blocks/\(stateHash)"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        dataTask?.cancel()
        
        dataTask = defaultSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                complete(.failure(error))
                return
            }
            guard let _ = response, let _ = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                complete(.failure(error))
                return
            }
            
            do {
                let block = try JSONDecoder().decode(Block.self, from: data!)
                complete(.success(block))
            } catch (let error) {
                debugPrint(error)
                complete(.failure(error))
            }
        }
        
        dataTask?.resume()
    }
    
    func getBlocks(_ limit: Int?, _ complete: @escaping (Result<Blocks, Error>) -> ()) {
        var urlString: String
        if let limit = limit {
            urlString = "https://api.minaexplorer.com/blocks?limit=\(limit)"
        } else {
            urlString = "https://api.minaexplorer.com/blocks"
        }

        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        dataTask?.cancel()
        
        dataTask = defaultSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                complete(.failure(error))
                return
            }
            guard let _ = response, let _ = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                complete(.failure(error))
                return
            }
            
            do {
                let blocks = try JSONDecoder().decode(Blocks.self, from: data!)
                complete(.success(blocks))
            } catch (let error) {
                debugPrint(error)
                complete(.failure(error))
            }
        }
        
        dataTask?.resume()
    }
    
//    func exchangeTokenRequest(_ publicToken: String, complete:@escaping (Result<String, Error>) -> ()) {
//        let urlString = "https://production.plaid.com/item/public_token/exchange"
//
//        var request = URLRequest(url: URL(string: urlString)!)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let parameters = ["client_id" : client_id,
//                          "secret" : secret,
//                          "public_token" : publicToken]
//
//        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//
//        dataTask?.cancel()
//
//        dataTask = defaultSession.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                complete(.failure(error))
//                return
//            }
//            guard let _ = response, let _ = data else {
//                let error = NSError(domain: "error", code: 0, userInfo: nil)
//                complete(.failure(error))
//                return
//            }
//
//            do {
//                let tokenResponse = try JSONDecoder().decode(PlaidAccessTokenResponse.self, from: data!)
//                complete(.success(tokenResponse.access_token))
//            } catch (let error) {
//                debugPrint(error)
//                complete(.failure(error))
//            }
//        }
//
//        dataTask?.resume()
//    }
}
