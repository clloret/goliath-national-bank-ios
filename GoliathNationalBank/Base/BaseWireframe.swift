import UIKit

protocol WireframeProtocol: AnyObject {
    func showError(_ errorMessage: String)
}

class BaseWireframe {
    private let alertUtils: AlertUtilsProtocol?
    private unowned var _viewController: UIViewController

    // to retain view controller reference upon first access
    private var _temporaryStoredViewController: UIViewController?
    var navigationControllerProtocol: UINavigationControllerProtocol?

    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }

    var navigationController: UINavigationControllerProtocol? {
        return navigationControllerProtocol ?? viewController.navigationController
    }

    init(resolver: AppResolver, viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
        alertUtils = resolver.resolve(AlertUtilsProtocol.self)
    }
}

extension BaseWireframe: WireframeProtocol {
    func showError(_ errorMessage: String) {
        alertUtils?.showError(in: viewController, with: errorMessage)
    }
}

extension BaseWireframe: Hashable {
    static func == (lhs: BaseWireframe, rhs: BaseWireframe) -> Bool {
        return lhs.viewController == rhs.viewController
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(viewController)
    }
}

extension UIViewController {
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
}

extension UINavigationController {
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        setViewControllers([wireframe.viewController], animated: animated)
    }
}

protocol UINavigationControllerProtocol {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool)
}

extension UINavigationController: UINavigationControllerProtocol {
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        pushViewController(wireframe.viewController, animated: animated)
    }
}
