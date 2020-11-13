import Foundation
import Moya
import VlaggenNetworkModels

/// See `ParameterService` for documentation about the different endpoints.
public class ParameterAsyncNetwork: ParameterAsyncNetworkable {
    public let provider: MoyaProvider<ParameterService>

    public convenience init(server: URL) {
        self.init(provider: VlaggenProvider<ParameterService>(server: server))
    }

    internal init(provider: MoyaProvider<ParameterService>) {
        self.provider = provider
    }

    public func list(completion: @escaping (Result<[ParameterResponse], MoyaError>) -> Void) {
        provider.request(.list, to: [ParameterResponse].self, completion: completion)
    }
}
