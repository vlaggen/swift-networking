import XCTest
@testable import VlaggenNetworking
import VlaggenNetworkModels
import Moya

final class ParameterAsyncNetworkTests: XCTestCase {

    var sut: ParameterAsyncNetwork!

    // MARK: - List

    func test_list() throws {
        // Given
        sut = try ParameterAsyncNetwork(fileName: "get_api_v1_parameters_200")

        // When
        let expectation = XCTestExpectation(description: "Retrieving parameters")

        var sutResult: Result<[ParameterResponse], MoyaError>? = nil
        sut.list { (result) in
            sutResult = result
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        // Then
        let expected = [
            ParameterResponse(key: "key_1", value: .string("valuevalue")),
            ParameterResponse(key: "key_2", value: .double(1)),
            ParameterResponse(key: "key_3", value: .double(1.4)),
            ParameterResponse(key: "key_4", value: .bool(true)),
        ]
        assert(sutResult, contains: expected)
    }
}

extension ParameterAsyncNetwork {

    convenience init(statusCode: Int = 200, fileName: String) throws {
        let fileURL = Bundle.module.url(forResource: fileName, withExtension: "json")!
        let data = try Data(contentsOf: fileURL)
        self.init(response: .networkResponse(statusCode, data))
    }

    convenience init(response: EndpointSampleResponse) {
        self.init(provider: MoyaProvider<ParameterService>(response: response))
    }
}
