import XCTest
@testable import VlaggenNetworking
import VlaggenNetworkModels
import Moya

final class ParameterSynchroniseNetworkTests: XCTestCase {

    var sut: ParameterSyncNetwork!

    // MARK: - List

    func test_list() throws {
        // Given
        sut = try ParameterSyncNetwork(fileName: "get_api_v1_parameters_200")

        // When
        let result = sut.list()

        let expected = [
            ParameterResponse(key: "key_1", value: .string("valuevalue")),
            ParameterResponse(key: "key_2", value: .double(1)),
            ParameterResponse(key: "key_3", value: .double(1.4)),
            ParameterResponse(key: "key_4", value: .bool(true)),
        ]
        switch result {
            case .success(let items):
                XCTAssertEqual(items, expected)
            case .failure(let error):
                XCTFail("An error was thrown: \(error)")
        }
    }
}

extension ParameterSyncNetwork {

    convenience init(statusCode: Int = 200, fileName: String) throws {
        let fileURL = Bundle.module.url(forResource: fileName, withExtension: "json")!
        let data = try Data(contentsOf: fileURL)
        self.init(response: .networkResponse(statusCode, data))
    }

    convenience init(response: EndpointSampleResponse) {
        self.init(provider: MoyaProvider<ParameterService>(response: response))
    }
}
