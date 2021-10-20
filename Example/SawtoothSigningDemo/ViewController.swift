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

        /// 随机生成公私钥. 签名与验签
//        randomPrivateKeyPublicKeySignerVerify()

        /// 已知 私钥 生成公钥, 签名验证
        customPrivateKeyGetPublickeySignerVerify()

    }

    /// 随机生成公私钥. 签名与验签
    func randomPrivateKeyPublicKeySignerVerify() {
        let context = Secp256k1Context()
        let privateKey = context.newRandomPrivateKey()

        guard let publicKey = try? context.getPublicKey(privateKey: privateKey) else {return}
        print("私钥: \(privateKey.hex())")
        print("公钥: \(publicKey.hex())")

        let signer = Signer(context: context, privateKey: privateKey)
        let messageStr = "Hello, word"

        guard let signature = try? signer.sign(data: [UInt8](messageStr.utf8)) else {
            return
        }
        print("签名: \(signature)")

        guard let verifyState = try? context.verify(signature: signature, data: [UInt8](messageStr.utf8),publicKey: signer.getPublicKey()) else {
            return
        }
        print("验证结果: \(verifyState)")
    }

    /// 已知 私钥 生成公钥, 签名验证
    func customPrivateKeyGetPublickeySignerVerify(){
        let privateKeyStr = "8473183071bb2eb019a90fd7579d66bcaaaa34a454b4c3e8d3719ff72eca8c82"
        let customPrivateKey = Secp256k1PrivateKey.fromHex(hexPrivKey: privateKeyStr)
        print("自定义私钥: \(customPrivateKey.hex())")
        let context = Secp256k1Context()
        guard let customPublicKey = try? context.getPublicKey(privateKey: customPrivateKey) else {return}
        print("自定义公钥: \(customPublicKey.hex())")
        let signer = Signer(context: context, privateKey: customPrivateKey)
        let messageStr = "Hello, word"

        guard let signature = try? signer.sign(data: [UInt8](messageStr.utf8)) else {
            return
        }
        print("签名: \(signature)")

        guard let verifyState = try? context.verify(signature: signature, data: [UInt8](messageStr.utf8),publicKey: signer.getPublicKey()) else {
            return
        }
        print("验证结果: \(verifyState)")
    }
}

extension StringProtocol {
    var hexaData: Data { .init(hexa) }
    var hexaBytes: [UInt8] { .init(hexa) }
    private var hexa: UnfoldSequence<UInt8, Index> {
        sequence(state: startIndex) { start in
            guard start < self.endIndex else { return nil }
            let end = self.index(start, offsetBy: 2, limitedBy: self.endIndex) ?? self.endIndex
            defer { start = end }
            return UInt8(self[start..<end], radix: 16)
        }
    }
}
