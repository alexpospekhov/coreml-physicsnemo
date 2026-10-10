//
// NVIDIA_CorrDiff_98M_Regression.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public class NVIDIA_CorrDiff_98M_RegressionInput : MLFeatureProvider {

    /// atmospheric_sar_inputs as 1 × 59 × 256 × 256 4-dimensional array of floats
    public var atmospheric_sar_inputs: MLMultiArray

    /// time_step as 1 element vector of floats
    public var time_step: MLMultiArray

    public var featureNames: Set<String> { ["atmospheric_sar_inputs", "time_step"] }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if featureName == "atmospheric_sar_inputs" {
            return MLFeatureValue(multiArray: atmospheric_sar_inputs)
        }
        if featureName == "time_step" {
            return MLFeatureValue(multiArray: time_step)
        }
        return nil
    }

    public init(atmospheric_sar_inputs: MLMultiArray, time_step: MLMultiArray) {
        self.atmospheric_sar_inputs = atmospheric_sar_inputs
        self.time_step = time_step
    }

    public convenience init(atmospheric_sar_inputs: MLShapedArray<Float>, time_step: MLShapedArray<Float>) {
        self.init(atmospheric_sar_inputs: MLMultiArray(atmospheric_sar_inputs), time_step: MLMultiArray(time_step))
    }

}


/// Model Prediction Output Type
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public class NVIDIA_CorrDiff_98M_RegressionOutput : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// high_res_physical_fields as 1 × 45 × 256 × 256 4-dimensional array of 16-bit floats
    public var high_res_physical_fields: MLMultiArray {
        provider.featureValue(for: "high_res_physical_fields")!.multiArrayValue!
    }

    /// high_res_physical_fields as 1 × 45 × 256 × 256 4-dimensional array of 16-bit floats
    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #endif
    public var high_res_physical_fieldsShapedArray: MLShapedArray<Float16> {
        MLShapedArray<Float16>(high_res_physical_fields)
    }

    public var featureNames: Set<String> {
        provider.featureNames
    }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        provider.featureValue(for: featureName)
    }

    public init(high_res_physical_fields: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["high_res_physical_fields" : MLFeatureValue(multiArray: high_res_physical_fields)])
    }

    public init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public class NVIDIA_CorrDiff_98M_Regression {
    public let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "NVIDIA_CorrDiff_98M_Regression", withExtension:"mlmodelc")!
    }

    /**
        Construct NVIDIA_CorrDiff_98M_Regression instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of NVIDIA_CorrDiff_98M_Regression.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `NVIDIA_CorrDiff_98M_Regression.urlOfModelInThisBundle` to create a MLModel object to pass-in.

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
        Construct NVIDIA_CorrDiff_98M_Regression instance with explicit path to mlmodelc file
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
        Construct NVIDIA_CorrDiff_98M_Regression instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_CorrDiff_98M_Regression, Error>) -> Void) {
        load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct NVIDIA_CorrDiff_98M_Regression instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_CorrDiff_98M_Regression {
        try await load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct NVIDIA_CorrDiff_98M_Regression instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_CorrDiff_98M_Regression, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(NVIDIA_CorrDiff_98M_Regression(model: model)))
            }
        }
    }

    /**
        Construct NVIDIA_CorrDiff_98M_Regression instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_CorrDiff_98M_Regression {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return NVIDIA_CorrDiff_98M_Regression(model: model)
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_CorrDiff_98M_RegressionInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_CorrDiff_98M_RegressionOutput
    */
    public func prediction(input: NVIDIA_CorrDiff_98M_RegressionInput) throws -> NVIDIA_CorrDiff_98M_RegressionOutput {
        try prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_CorrDiff_98M_RegressionInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_CorrDiff_98M_RegressionOutput
    */
    public func prediction(input: NVIDIA_CorrDiff_98M_RegressionInput, options: MLPredictionOptions) throws -> NVIDIA_CorrDiff_98M_RegressionOutput {
        let outFeatures = try model.prediction(from: input, options: options)
        return NVIDIA_CorrDiff_98M_RegressionOutput(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_CorrDiff_98M_RegressionInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_CorrDiff_98M_RegressionOutput
    */
    public func prediction(input: NVIDIA_CorrDiff_98M_RegressionInput, options: MLPredictionOptions = MLPredictionOptions()) async throws -> NVIDIA_CorrDiff_98M_RegressionOutput {
        let outFeatures = try await model.prediction(from: input, options: options)
        return NVIDIA_CorrDiff_98M_RegressionOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - atmospheric_sar_inputs: 1 × 59 × 256 × 256 4-dimensional array of floats
            - time_step: 1 element vector of floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_CorrDiff_98M_RegressionOutput
    */
    public func prediction(atmospheric_sar_inputs: MLMultiArray, time_step: MLMultiArray) throws -> NVIDIA_CorrDiff_98M_RegressionOutput {
        let input_ = NVIDIA_CorrDiff_98M_RegressionInput(atmospheric_sar_inputs: atmospheric_sar_inputs, time_step: time_step)
        return try prediction(input: input_)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - atmospheric_sar_inputs: 1 × 59 × 256 × 256 4-dimensional array of floats
            - time_step: 1 element vector of floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_CorrDiff_98M_RegressionOutput
    */

    public func prediction(atmospheric_sar_inputs: MLShapedArray<Float>, time_step: MLShapedArray<Float>) throws -> NVIDIA_CorrDiff_98M_RegressionOutput {
        let input_ = NVIDIA_CorrDiff_98M_RegressionInput(atmospheric_sar_inputs: atmospheric_sar_inputs, time_step: time_step)
        return try prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - inputs: the inputs to the prediction as [NVIDIA_CorrDiff_98M_RegressionInput]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [NVIDIA_CorrDiff_98M_RegressionOutput]
    */
    public func predictions(inputs: [NVIDIA_CorrDiff_98M_RegressionInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [NVIDIA_CorrDiff_98M_RegressionOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [NVIDIA_CorrDiff_98M_RegressionOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  NVIDIA_CorrDiff_98M_RegressionOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
