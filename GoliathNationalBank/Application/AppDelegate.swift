//
//  AppDelegate.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Swinject
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    private let container = Container()
    private let assembler: Assembler

    var window: UIWindow?

    override init() {
        assembler = Assembler(
            [
                DataAssembly(),
                BusinessAssemby(),
                ProductListAssembly(),
                ProductDetailsAssembly()
            ],
            container: container
        )
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let initialController = AppNavigationController()
        let wireframe = assembler.resolver.resolve(ProductListWireframeProtocol.self) as! BaseWireframe
        initialController.setRootWireframe(wireframe)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initialController
        window?.makeKeyAndVisible()

        return true
    }
}
