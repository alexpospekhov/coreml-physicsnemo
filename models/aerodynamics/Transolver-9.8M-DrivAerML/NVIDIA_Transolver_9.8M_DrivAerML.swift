//
// NVIDIA_Transolver_9_8M_DrivAerML.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public class NVIDIA_Transolver_9_8M_DrivAerMLInput : MLFeatureProvider {

    /// fx as 1 × 1024 × 5 3-dimensional array of 16-bit floats
    public var fx: MLMultiArray

    /// embedding as 1 × 1024 × 3 3-dimensional array of 16-bit floats
    public var embedding: MLMultiArray

    public var featureNames: Set<String> { ["fx", "embedding"] }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if featureName == "fx" {
            return MLFeatureValue(multiArray: fx)
        }
        if featureName == "embedding" {
            return MLFeatureValue(multiArray: embedding)
        }
        return nil
    }

    public init(fx: MLMultiArray, embedding: MLMultiArray) {
        self.fx = fx
        self.embedding = embedding
    }

    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #else
    @available(macOS 15.0, *)
    #endif
    public convenience init(fx: MLShapedArray<Float16>, embedding: MLShapedArray<Float16>) {
        self.init(fx: MLMultiArray(fx), embedding: MLMultiArray(embedding))
    }

}


/// Model Prediction Output Type
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public class NVIDIA_Transolver_9_8M_DrivAerMLOutput : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// surface_fields as 1 × 1024 × 4 3-dimensional array of 16-bit floats
    public var surface_fields: MLMultiArray {
        provider.featureValue(for: "surface_fields")!.multiArrayValue!
    }

    /// surface_fields as 1 × 1024 × 4 3-dimensional array of 16-bit floats
    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #else
    @available(macOS 15.0, *)
    #endif
    public var surface_fieldsShapedArray: MLShapedArray<Float16> {
        MLShapedArray<Float16>(surface_fields)
    }

    public var featureNames: Set<String> {
        provider.featureNames
    }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        provider.featureValue(for: featureName)
    }

    public init(surface_fields: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["surface_fields" : MLFeatureValue(multiArray: surface_fields)])
    }

    public init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
public class NVIDIA_Transolver_9_8M_DrivAerML {
    public let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "NVIDIA_Transolver_9.8M_DrivAerML", withExtension:"mlmodelc")!
    }

    /**
        Construct NVIDIA_Transolver_9_8M_DrivAerML instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of NVIDIA_Transolver_9_8M_DrivAerML.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `NVIDIA_Transolver_9_8M_DrivAerML.urlOfModelInThisBundle` to create a MLModel object to pass-in.

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
        Construct NVIDIA_Transolver_9_8M_DrivAerML instance with explicit path to mlmodelc file
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
        Construct NVIDIA_Transolver_9_8M_DrivAerML instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_Transolver_9_8M_DrivAerML, Error>) -> Void) {
        load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct NVIDIA_Transolver_9_8M_DrivAerML instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_Transolver_9_8M_DrivAerML {
        try await load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct NVIDIA_Transolver_9_8M_DrivAerML instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_Transolver_9_8M_DrivAerML, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(NVIDIA_Transolver_9_8M_DrivAerML(model: model)))
            }
        }
    }

    /**
        Construct NVIDIA_Transolver_9_8M_DrivAerML instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_Transolver_9_8M_DrivAerML {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return NVIDIA_Transolver_9_8M_DrivAerML(model: model)
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_Transolver_9_8M_DrivAerMLInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_Transolver_9_8M_DrivAerMLOutput
    */
    public func prediction(input: NVIDIA_Transolver_9_8M_DrivAerMLInput) throws -> NVIDIA_Transolver_9_8M_DrivAerMLOutput {
        try prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_Transolver_9_8M_DrivAerMLInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_Transolver_9_8M_DrivAerMLOutput
    */
    public func prediction(input: NVIDIA_Transolver_9_8M_DrivAerMLInput, options: MLPredictionOptions) throws -> NVIDIA_Transolver_9_8M_DrivAerMLOutput {
        let outFeatures = try model.prediction(from: input, options: options)
        return NVIDIA_Transolver_9_8M_DrivAerMLOutput(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_Transolver_9_8M_DrivAerMLInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_Transolver_9_8M_DrivAerMLOutput
    */
    public func prediction(input: NVIDIA_Transolver_9_8M_DrivAerMLInput, options: MLPredictionOptions = MLPredictionOptions()) async throws -> NVIDIA_Transolver_9_8M_DrivAerMLOutput {
        let outFeatures = try await model.prediction(from: input, options: options)
        return NVIDIA_Transolver_9_8M_DrivAerMLOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - fx: 1 × 1024 × 5 3-dimensional array of 16-bit floats
            - embedding: 1 × 1024 × 3 3-dimensional array of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_Transolver_9_8M_DrivAerMLOutput
    */
    public func prediction(fx: MLMultiArray, embedding: MLMultiArray) throws -> NVIDIA_Transolver_9_8M_DrivAerMLOutput {
        let input_ = NVIDIA_Transolver_9_8M_DrivAerMLInput(fx: fx, embedding: embedding)
        return try prediction(input: input_)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - fx: 1 × 1024 × 5 3-dimensional array of 16-bit floats
            - embedding: 1 × 1024 × 3 3-dimensional array of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_Transolver_9_8M_DrivAerMLOutput
    */

    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #else
    @available(macOS 15.0, *)
    #endif
    public func prediction(fx: MLShapedArray<Float16>, embedding: MLShapedArray<Float16>) throws -> NVIDIA_Transolver_9_8M_DrivAerMLOutput {
        let input_ = NVIDIA_Transolver_9_8M_DrivAerMLInput(fx: fx, embedding: embedding)
        return try prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - inputs: the inputs to the prediction as [NVIDIA_Transolver_9_8M_DrivAerMLInput]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [NVIDIA_Transolver_9_8M_DrivAerMLOutput]
    */
    public func predictions(inputs: [NVIDIA_Transolver_9_8M_DrivAerMLInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [NVIDIA_Transolver_9_8M_DrivAerMLOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [NVIDIA_Transolver_9_8M_DrivAerMLOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  NVIDIA_Transolver_9_8M_DrivAerMLOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
