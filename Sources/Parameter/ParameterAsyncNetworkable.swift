import Foundation
import Moya
import VlaggenNetworkModels

/// See `ParameterService` for documentation about the different endpoints.
public protocol ParameterAsyncNetworkable {
    
    /// List of parameters
    func list(completion: @escaping (_ result: Result<[ParameterResponse], MoyaError>) -> Void)
}
