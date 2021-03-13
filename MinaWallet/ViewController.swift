//
//  ViewController.swift
//  MinaWallet
//
//  Created by Jeffrey Jackson on 3/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MinaRestAPIDataManagerImp.shared.getBlockchainSummary { result in
//            switch result {
//            case .success(let blockchain):
//                print(blockchain)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
//        MinaRestAPIDataManagerImp.shared.getAccountDetails("B62qmzFhotZHH1vLdhfDtSLpyFStzYDpVoFY3bsQ1w4Qe53hWhvza3T") { result in
//            switch result {
//            case .success(let account):
//                print(account)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
//        MinaRestAPIDataManagerImp.shared.getBlock("3NLjhemUmnzeVzfo8Uy6GJWNLuQiHZcWcuManHPoPNo2d4sG9cuZ") { result in
//            switch result {
//            case .success(let block):
//                print(block)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        MinaRestAPIDataManagerImp.shared.getBlocks(5) { result in
            switch result {
            case .success(let blocks):
                print(blocks)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

}

