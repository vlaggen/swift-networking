import Foundation
import Moya

/// An extension on MoyaProvider to init with server and token.
public class VlaggenProvider<Target: TargetType>: MoyaProvider<Target> {

    /// Init to instantiate class with a server
    /// - Parameters:
    ///   - server: baseURL of server that is running the Vlaggen API
    convenience init(server: URL) {
        self.init(endpointClosure: { target -> Endpoint in
            let urlString = server.appendingPathComponent(target.path).absoluteString

            return Endpoint(target: target, url: urlString)
        })
    }
}
