//
//  ViewController.swift
//  SawtoothSigningDemo
//
//  Created by iOS on 2021/10/20.
//

import UIKit
import SawtoothSigning

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let context = Secp256k1Context()
        let privateKey = context.newRandomPrivateKey()
        let signer = Signer(context: context, privateKey: privateKey)
        let messageStr = "Hello, word"

        guard let signature = try? signer.sign(data: [UInt8](messageStr.utf8)) else {
            return
        }
        guard let istrue = try? context.verify(signature: signature, data: [UInt8](messageStr.utf8),publicKey: signer.getPublicKey()) else {
            return
        }
        print(istrue)

    }
}

