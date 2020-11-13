import Foundation
import Moya
import VlaggenNetworkModels

/// See `ParameterService` for documentation about the different endpoints.
public class ParameterSyncNetwork: ParameterSyncNetworkable {
    private let provider: MoyaProvider<ParameterService>

    public convenience init(server: URL) {
        self.init(provider: VlaggenProvider<ParameterService>(server: server))
    }

    internal init(provider: MoyaProvider<ParameterService>) {
        self.provider = provider
    }

    public func list() -> Result<[ParameterResponse], MoyaError> {
        return provider.request(.list, to: [ParameterResponse].self)
    }
}
