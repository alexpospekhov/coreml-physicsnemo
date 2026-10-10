//
// NVIDIA_StormCast_265M_CONUS.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public class NVIDIA_StormCast_265M_CONUSInput : MLFeatureProvider {

    /// radar_convective_state as 1 × 228 × 256 × 256 4-dimensional array of 16-bit floats
    public var radar_convective_state: MLMultiArray

    /// sigma as 1 element vector of 16-bit floats
    public var sigma: MLMultiArray

    /// condition as 1 by 2 matrix of 16-bit floats
    public var condition: MLMultiArray

    public var featureNames: Set<String> { ["radar_convective_state", "sigma", "condition"] }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if featureName == "radar_convective_state" {
            return MLFeatureValue(multiArray: radar_convective_state)
        }
        if featureName == "sigma" {
            return MLFeatureValue(multiArray: sigma)
        }
        if featureName == "condition" {
            return MLFeatureValue(multiArray: condition)
        }
        return nil
    }

    public init(radar_convective_state: MLMultiArray, sigma: MLMultiArray, condition: MLMultiArray) {
        self.radar_convective_state = radar_convective_state
        self.sigma = sigma
        self.condition = condition
    }

    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #else
    @available(macOS 15.0, *)
    #endif
    public convenience init(radar_convective_state: MLShapedArray<Float16>, sigma: MLShapedArray<Float16>, condition: MLShapedArray<Float16>) {
        self.init(radar_convective_state: MLMultiArray(radar_convective_state), sigma: MLMultiArray(sigma), condition: MLMultiArray(condition))
    }

}


/// Model Prediction Output Type
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public class NVIDIA_StormCast_265M_CONUSOutput : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// forecast_storm_state as 1 × 99 × 256 × 256 4-dimensional array of 16-bit floats
    public var forecast_storm_state: MLMultiArray {
        provider.featureValue(for: "forecast_storm_state")!.multiArrayValue!
    }

    /// forecast_storm_state as 1 × 99 × 256 × 256 4-dimensional array of 16-bit floats
    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #else
    @available(macOS 15.0, *)
    #endif
    public var forecast_storm_stateShapedArray: MLShapedArray<Float16> {
        MLShapedArray<Float16>(forecast_storm_state)
    }

    public var featureNames: Set<String> {
        provider.featureNames
    }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        provider.featureValue(for: featureName)
    }

    public init(forecast_storm_state: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["forecast_storm_state" : MLFeatureValue(multiArray: forecast_storm_state)])
    }

    public init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public class NVIDIA_StormCast_265M_CONUS {
    public let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "NVIDIA_StormCast_265M_CONUS", withExtension:"mlmodelc")!
    }

    /**
        Construct NVIDIA_StormCast_265M_CONUS instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of NVIDIA_StormCast_265M_CONUS.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `NVIDIA_StormCast_265M_CONUS.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    public convenience init(configuration: MLModelConfiguration = MLModelConfiguration()) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct NVIDIA_StormCast_265M_CONUS instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    public convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    public convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct NVIDIA_StormCast_265M_CONUS instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_StormCast_265M_CONUS, Error>) -> Void) {
        load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct NVIDIA_StormCast_265M_CONUS instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_StormCast_265M_CONUS {
        try await load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct NVIDIA_StormCast_265M_CONUS instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_StormCast_265M_CONUS, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(NVIDIA_StormCast_265M_CONUS(model: model)))
            }
        }
    }

    /**
        Construct NVIDIA_StormCast_265M_CONUS instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_StormCast_265M_CONUS {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return NVIDIA_StormCast_265M_CONUS(model: model)
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_StormCast_265M_CONUSInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_StormCast_265M_CONUSOutput
    */
    public func prediction(input: NVIDIA_StormCast_265M_CONUSInput) throws -> NVIDIA_StormCast_265M_CONUSOutput {
        try prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_StormCast_265M_CONUSInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_StormCast_265M_CONUSOutput
    */
    public func prediction(input: NVIDIA_StormCast_265M_CONUSInput, options: MLPredictionOptions) throws -> NVIDIA_StormCast_265M_CONUSOutput {
        let outFeatures = try model.prediction(from: input, options: options)
        return NVIDIA_StormCast_265M_CONUSOutput(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_StormCast_265M_CONUSInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_StormCast_265M_CONUSOutput
    */
    public func prediction(input: NVIDIA_StormCast_265M_CONUSInput, options: MLPredictionOptions = MLPredictionOptions()) async throws -> NVIDIA_StormCast_265M_CONUSOutput {
        let outFeatures = try await model.prediction(from: input, options: options)
        return NVIDIA_StormCast_265M_CONUSOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - radar_convective_state: 1 × 228 × 256 × 256 4-dimensional array of 16-bit floats
            - sigma: 1 element vector of 16-bit floats
            - condition: 1 by 2 matrix of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_StormCast_265M_CONUSOutput
    */
    public func prediction(radar_convective_state: MLMultiArray, sigma: MLMultiArray, condition: MLMultiArray) throws -> NVIDIA_StormCast_265M_CONUSOutput {
        let input_ = NVIDIA_StormCast_265M_CONUSInput(radar_convective_state: radar_convective_state, sigma: sigma, condition: condition)
        return try prediction(input: input_)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - radar_convective_state: 1 × 228 × 256 × 256 4-dimensional array of 16-bit floats
            - sigma: 1 element vector of 16-bit floats
            - condition: 1 by 2 matrix of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_StormCast_265M_CONUSOutput
    */

    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #else
    @available(macOS 15.0, *)
    #endif
    public func prediction(radar_convective_state: MLShapedArray<Float16>, sigma: MLShapedArray<Float16>, condition: MLShapedArray<Float16>) throws -> NVIDIA_StormCast_265M_CONUSOutput {
        let input_ = NVIDIA_StormCast_265M_CONUSInput(radar_convective_state: radar_convective_state, sigma: sigma, condition: condition)
        return try prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - inputs: the inputs to the prediction as [NVIDIA_StormCast_265M_CONUSInput]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [NVIDIA_StormCast_265M_CONUSOutput]
    */
    public func predictions(inputs: [NVIDIA_StormCast_265M_CONUSInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [NVIDIA_StormCast_265M_CONUSOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [NVIDIA_StormCast_265M_CONUSOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  NVIDIA_StormCast_265M_CONUSOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
