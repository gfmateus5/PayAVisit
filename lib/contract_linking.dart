import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class ContractLinking extends ChangeNotifier {
  Client httpClient;
  Web3Client ethClient;

  // JSON-RPC is a remote procedure call protocol encoded in JSON
  // Remote Procedure Call (RPC) is about executing a block of code on another server
  String rpcUrl = "http://192.168.1.71:7545";

  ContractLinking() {
    initialSetup();
  }

  Future<void> initialSetup() async {
    /// This will start a client that connects to a JSON RPC API, available at RPC URL.
    /// The httpClient will be used to send requests to the [RPC server].
    httpClient = Client();

    /// It connects to an Ethereum [node] to send transactions, interact with smart contracts, and much more!
    ethClient = Web3Client(rpcUrl, httpClient);

    await getCredentials();
    await getDeployedContract();
    await getContractFunctions();
  }

  /// This will construct [credentials] with the provided [privateKey]
  /// and load the Ethereum address in [myAddress] specified by these credentials.
  String privateKey =
      "cb762b74bfb6edcbc94daf0a081b950e20c17220f70f405f3e8f47d7d4f3bc32";
  Credentials credentials;
  EthereumAddress myAddress;

  Future<void> getCredentials() async {
    credentials = await ethClient.credentialsFromPrivateKey(privateKey);
    myAddress = await credentials.extractAddress();
  }

  /// This will parse an Ethereum address of the contract in [contractAddress]
  /// from the hexadecimal representation present inside the [ABI]
  String abi;
  EthereumAddress contractAddress;

  Future<void> getDeployedContract() async {
    String abiString = await rootBundle.loadString('src/artifacts/PayAVisit.json');
    var abiJson = jsonDecode(abiString);
    abi = jsonEncode(abiJson['abi']);

    contractAddress =
        EthereumAddress.fromHex(abiJson['networks']['5777']['address']);
  }

  /// This will help us to find all the [public functions] defined by the [contract]
  DeployedContract contract;
  ContractFunction getBalanceAmount,
      addDepositAmount,
      payAmount;

  Future<void> getContractFunctions() async {
    contract = DeployedContract(
        ContractAbi.fromJson(abi, "PayAVisit"), contractAddress);

    getBalanceAmount = contract.function('getBalanceAmount');
    addDepositAmount = contract.function('addDepositAmount');
    payAmount = contract.function('payAmount');
  }

  /// This will call a [functionName] with [functionArgs] as parameters
  /// defined in the [contract] and returns its result
  Future<List<dynamic>> readContract(ContractFunction functionName,
      List<dynamic> functionArgs,) async {
    var queryResult = await ethClient.call(
      contract: contract,
      function: functionName,
      params: functionArgs,
    );

    return queryResult;
  }

  /// Signs the given transaction using the keys supplied in the [credentials] object
  /// to upload it to the client so that it can be executed
  Future<void> writeContract(ContractFunction functionName,
      List<dynamic> functionArgs,) async {
    await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: functionName,
        parameters: functionArgs,
      ),
    );
  }
}