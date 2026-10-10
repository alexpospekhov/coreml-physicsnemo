//
// NVIDIA_FourCastNet_75M_AFNO.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public class NVIDIA_FourCastNet_75M_AFNOInput : MLFeatureProvider {

    /// global_atmospheric_state as 1 × 26 × 720 × 1440 4-dimensional array of 16-bit floats
    public var global_atmospheric_state: MLMultiArray

    public var featureNames: Set<String> { ["global_atmospheric_state"] }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if featureName == "global_atmospheric_state" {
            return MLFeatureValue(multiArray: global_atmospheric_state)
        }
        return nil
    }

    public init(global_atmospheric_state: MLMultiArray) {
        self.global_atmospheric_state = global_atmospheric_state
    }

    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #else
    @available(macOS 15.0, *)
    #endif
    public convenience init(global_atmospheric_state: MLShapedArray<Float16>) {
        self.init(global_atmospheric_state: MLMultiArray(global_atmospheric_state))
    }

}


/// Model Prediction Output Type
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public class NVIDIA_FourCastNet_75M_AFNOOutput : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// forecast_atmospheric_state as 1 × 26 × 720 × 1440 4-dimensional array of 16-bit floats
    public var forecast_atmospheric_state: MLMultiArray {
        provider.featureValue(for: "forecast_atmospheric_state")!.multiArrayValue!
    }

    /// forecast_atmospheric_state as 1 × 26 × 720 × 1440 4-dimensional array of 16-bit floats
    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #else
    @available(macOS 15.0, *)
    #endif
    public var forecast_atmospheric_stateShapedArray: MLShapedArray<Float16> {
        MLShapedArray<Float16>(forecast_atmospheric_state)
    }

    public var featureNames: Set<String> {
        provider.featureNames
    }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        provider.featureValue(for: featureName)
    }

    public init(forecast_atmospheric_state: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["forecast_atmospheric_state" : MLFeatureValue(multiArray: forecast_atmospheric_state)])
    }

    public init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public class NVIDIA_FourCastNet_75M_AFNO {
    public let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "NVIDIA_FourCastNet_75M_AFNO", withExtension:"mlmodelc")!
    }

    /**
        Construct NVIDIA_FourCastNet_75M_AFNO instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of NVIDIA_FourCastNet_75M_AFNO.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `NVIDIA_FourCastNet_75M_AFNO.urlOfModelInThisBundle` to create a MLModel object to pass-in.

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
        Construct NVIDIA_FourCastNet_75M_AFNO instance with explicit path to mlmodelc file
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
        Construct NVIDIA_FourCastNet_75M_AFNO instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_FourCastNet_75M_AFNO, Error>) -> Void) {
        load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct NVIDIA_FourCastNet_75M_AFNO instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_FourCastNet_75M_AFNO {
        try await load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct NVIDIA_FourCastNet_75M_AFNO instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_FourCastNet_75M_AFNO, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(NVIDIA_FourCastNet_75M_AFNO(model: model)))
            }
        }
    }

    /**
        Construct NVIDIA_FourCastNet_75M_AFNO instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_FourCastNet_75M_AFNO {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return NVIDIA_FourCastNet_75M_AFNO(model: model)
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_FourCastNet_75M_AFNOInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_FourCastNet_75M_AFNOOutput
    */
    public func prediction(input: NVIDIA_FourCastNet_75M_AFNOInput) throws -> NVIDIA_FourCastNet_75M_AFNOOutput {
        try prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_FourCastNet_75M_AFNOInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_FourCastNet_75M_AFNOOutput
    */
    public func prediction(input: NVIDIA_FourCastNet_75M_AFNOInput, options: MLPredictionOptions) throws -> NVIDIA_FourCastNet_75M_AFNOOutput {
        let outFeatures = try model.prediction(from: input, options: options)
        return NVIDIA_FourCastNet_75M_AFNOOutput(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_FourCastNet_75M_AFNOInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_FourCastNet_75M_AFNOOutput
    */
    public func prediction(input: NVIDIA_FourCastNet_75M_AFNOInput, options: MLPredictionOptions = MLPredictionOptions()) async throws -> NVIDIA_FourCastNet_75M_AFNOOutput {
        let outFeatures = try await model.prediction(from: input, options: options)
        return NVIDIA_FourCastNet_75M_AFNOOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - global_atmospheric_state: 1 × 26 × 720 × 1440 4-dimensional array of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_FourCastNet_75M_AFNOOutput
    */
    public func prediction(global_atmospheric_state: MLMultiArray) throws -> NVIDIA_FourCastNet_75M_AFNOOutput {
        let input_ = NVIDIA_FourCastNet_75M_AFNOInput(global_atmospheric_state: global_atmospheric_state)
        return try prediction(input: input_)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - global_atmospheric_state: 1 × 26 × 720 × 1440 4-dimensional array of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_FourCastNet_75M_AFNOOutput
    */

    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #else
    @available(macOS 15.0, *)
    #endif
    public func prediction(global_atmospheric_state: MLShapedArray<Float16>) throws -> NVIDIA_FourCastNet_75M_AFNOOutput {
        let input_ = NVIDIA_FourCastNet_75M_AFNOInput(global_atmospheric_state: global_atmospheric_state)
        return try prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - inputs: the inputs to the prediction as [NVIDIA_FourCastNet_75M_AFNOInput]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [NVIDIA_FourCastNet_75M_AFNOOutput]
    */
    public func predictions(inputs: [NVIDIA_FourCastNet_75M_AFNOInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [NVIDIA_FourCastNet_75M_AFNOOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [NVIDIA_FourCastNet_75M_AFNOOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  NVIDIA_FourCastNet_75M_AFNOOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
