//
//  Models.swift
//  MinaWallet
//
//  Created by Jeffrey Jackson on 3/12/21.
//

import Foundation

struct Signature: Codable {
    var field: String
    var scalar: String
}

struct Payload: Codable {
    var to: String
    var from: String
    var fee: String
    var amount: String
    var nonce: String
    var memo: String
    var validUntil: String
}

struct SignedTransaction: Codable {
    var publicKey: String
    var signature: Signature
    var payload: Payload
}

struct SignedTransactionResponseResult: Codable {
    var payment: Transaction
}

struct AccountToken: Codable {
    var publicKey: String
    var token: String
}

struct Transaction: Codable {
    var amount: String
    var fee: String
    var feePayer: AccountToken
    var feeToken: String
    var from: String
    var fromAccount: AccountToken
    var hash: String
    var id: String
    var isDelegation: Bool
    var kind: String
    var memo: String
    var nonce: Int
    var receiver: AccountToken
    var source: AccountToken
    var to: String
    var token: String
    var toAccount: AccountToken
}

struct SignedTransactionResponse: Codable {
    var message: String
    var result: SignedTransactionResponseResult
}

struct SignedDelegationTransaction: Codable {
    var publicKey: String
    var signature: Signature
    var payload: Payload
}

struct SignedDelegationTransactionResponse: Codable {
    var message: String
    var result: SignedDelegationTransactionResponseResult
}

struct SignedDelegationTransactionResponseResult: Codable {
    var delegation: Transaction
}

struct PublicKey: Codable {
    var publicKey: String
}

struct ProtocolState: Codable {
    var blockchainState: BlockchainState
    var consensusState: ConsensusState
    var previousStateHash: String
}

struct BlockchainState: Codable {
    var date: Int
    var snarkedLedgerHash: String
    var stagedLedgerHash: String
    var utcDate: Int
}

struct Ledger: Codable {
    var hash: String
    var totalCurrency: Double
}

struct EpochData: Codable {
    var epochLength: Int
    var ledger: Ledger
    var lockCheckpoint: String
    var seed: String
    var startCheckpoint: String
}

struct ConsensusState: Codable {
    var blockHeight: Int
    var blockchainLength: Int
    var epoch: Int
    var epochCount: Int
    var hasAncestorInSameCheckpointWindow: Bool
    var lastVrfOutput: String
    var minWindowDensity: Int
    var nextEpochData: EpochData
    var slot: Int
    var slotSinceGenesis: Int
    var stakingEpochData: EpochData
}

struct SnarkJob: Codable {
    var blockHeight: Int
    var blockStateHash: String
    var dateTime: String
    var fee: Int
    var prover: String
    var workIds: [Int]?
}

struct Fee: Codable {
    var fee: Double
    var recipient: String
}

struct UserCommand: Codable {
    var amount: Int
    var blockHeight: Int
    var blockStateHash: String
    var dateTime: String
    var fee: Int
    var feePayer: AccountToken?
    var feeToken: Int
    var from: String
    var fromAccount: AccountToken?
    var hash: String
    var id: String
    var isDelegation: Bool
    var kind: String
    var memo: String
    var nonce: Int
    var receiver: PublicKey?
    var source: PublicKey?
    var to: String
    var toAccount: AccountToken?
    var token: Int
}

struct Transactions: Codable {
    var coinbase: Int
    var coinbaseReceiverAccount: PublicKey
    var feeTransfer: [Fee]
    var userCommands: [UserCommand]?
}

struct Block: Codable {
    var block: BlockDetails
}

struct Blocks: Codable {
    var blocks: [BlockDetails]
}

struct BlockDetails: Codable {
    var blockHeight: Int
    var canonical: Bool
    var creator: String
    var creatorAccount: PublicKey?
    var dateTime: String
    var protocolState: ProtocolState?
    var receivedTime: String
    var snarkJobs: [SnarkJob]?
    var stateHash: String
    var stateHashField: String
    var transactions: Transactions?
    var winnerAccount: PublicKey?
}

struct Balance: Codable {
    var total: String
    var unknown: String
}
struct Account: Codable {
    var account: AccountDetails
}
struct AccountDetails: Codable {
    var publicKey: String
    var balance: Balance
    var nonce: Int
    var receiptChainHash: String
    var delegate: String
    var votingFor: String
    var totalTx: Int
    var totalBlocks: Int
    var totalSnarks: Int
    var countPendingTransactions: Int
    var firstPendingTransaction: [String]
    var username: String
    var epochStakingAccount: [String]
    var nextEpochStakingAccount: [String]
    var epochDelegators: [String]
    var nextEpochDelegators: [String]
    var epochTotalStakingBalance: String
    var nextEpochTotalStakingBalance: String
}

struct Blockchain: Codable {
    var blockchainLength: Int
    var chainId: String
    var dateTime: String
    var epoch: Int
    var globalSlot: Int
    var minWindowDensity: Int
    var nextEpochLedgerHash: String
    var previousStateHash: String
    var slot: Int
    var snarkedLedgerHash: String
    var stagedLedgerHash: String
    var stakingEpochLedgerHash: String
    var stateHash: String
    var totalCurrency: Int
}
