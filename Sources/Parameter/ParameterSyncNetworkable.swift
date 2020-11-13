import Foundation
import Moya
import VlaggenNetworkModels

/// See `ParameterService` for documentation about the different endpoints.
public protocol ParameterSyncNetworkable {

    /// List of parameters
    func list() -> Result<[ParameterResponse], MoyaError>
}
