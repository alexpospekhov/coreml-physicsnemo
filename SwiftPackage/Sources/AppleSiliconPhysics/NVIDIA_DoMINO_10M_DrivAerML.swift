//
// NVIDIA_DoMINO_10M_DrivAerML.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public class NVIDIA_DoMINO_10M_DrivAerMLInput : MLFeatureProvider {

    /// geometry_coordinates as 1 × 256 × 3 3-dimensional array of 16-bit floats
    public var geometry_coordinates: MLMultiArray

    /// surf_grid as 1 × 128 × 64 × 64 × 3 5-dimensional array of 16-bit floats
    public var surf_grid: MLMultiArray

    /// sdf_surf_grid as 1 × 128 × 64 × 64 4-dimensional array of 16-bit floats
    public var sdf_surf_grid: MLMultiArray

    /// global_params_values as 1 by 2 matrix of 16-bit floats
    public var global_params_values: MLMultiArray

    /// global_params_reference as 1 by 2 matrix of 16-bit floats
    public var global_params_reference: MLMultiArray

    /// pos_surface_center_of_mass as 1 × 128 × 3 3-dimensional array of 16-bit floats
    public var pos_surface_center_of_mass: MLMultiArray

    /// surface_mesh_centers as 1 × 128 × 3 3-dimensional array of 16-bit floats
    public var surface_mesh_centers: MLMultiArray

    /// surface_mesh_neighbors as 1 × 128 × 7 × 3 4-dimensional array of 16-bit floats
    public var surface_mesh_neighbors: MLMultiArray

    /// surface_normals as 1 × 128 × 3 3-dimensional array of 16-bit floats
    public var surface_normals: MLMultiArray

    /// surface_neighbors_normals as 1 × 128 × 7 × 3 4-dimensional array of 16-bit floats
    public var surface_neighbors_normals: MLMultiArray

    /// surface_areas as 1 by 128 matrix of 16-bit floats
    public var surface_areas: MLMultiArray

    /// surface_neighbors_areas as 1 × 128 × 7 3-dimensional array of 16-bit floats
    public var surface_neighbors_areas: MLMultiArray

    public var featureNames: Set<String> { ["geometry_coordinates", "surf_grid", "sdf_surf_grid", "global_params_values", "global_params_reference", "pos_surface_center_of_mass", "surface_mesh_centers", "surface_mesh_neighbors", "surface_normals", "surface_neighbors_normals", "surface_areas", "surface_neighbors_areas"] }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if featureName == "geometry_coordinates" {
            return MLFeatureValue(multiArray: geometry_coordinates)
        }
        if featureName == "surf_grid" {
            return MLFeatureValue(multiArray: surf_grid)
        }
        if featureName == "sdf_surf_grid" {
            return MLFeatureValue(multiArray: sdf_surf_grid)
        }
        if featureName == "global_params_values" {
            return MLFeatureValue(multiArray: global_params_values)
        }
        if featureName == "global_params_reference" {
            return MLFeatureValue(multiArray: global_params_reference)
        }
        if featureName == "pos_surface_center_of_mass" {
            return MLFeatureValue(multiArray: pos_surface_center_of_mass)
        }
        if featureName == "surface_mesh_centers" {
            return MLFeatureValue(multiArray: surface_mesh_centers)
        }
        if featureName == "surface_mesh_neighbors" {
            return MLFeatureValue(multiArray: surface_mesh_neighbors)
        }
        if featureName == "surface_normals" {
            return MLFeatureValue(multiArray: surface_normals)
        }
        if featureName == "surface_neighbors_normals" {
            return MLFeatureValue(multiArray: surface_neighbors_normals)
        }
        if featureName == "surface_areas" {
            return MLFeatureValue(multiArray: surface_areas)
        }
        if featureName == "surface_neighbors_areas" {
            return MLFeatureValue(multiArray: surface_neighbors_areas)
        }
        return nil
    }

    public init(geometry_coordinates: MLMultiArray, surf_grid: MLMultiArray, sdf_surf_grid: MLMultiArray, global_params_values: MLMultiArray, global_params_reference: MLMultiArray, pos_surface_center_of_mass: MLMultiArray, surface_mesh_centers: MLMultiArray, surface_mesh_neighbors: MLMultiArray, surface_normals: MLMultiArray, surface_neighbors_normals: MLMultiArray, surface_areas: MLMultiArray, surface_neighbors_areas: MLMultiArray) {
        self.geometry_coordinates = geometry_coordinates
        self.surf_grid = surf_grid
        self.sdf_surf_grid = sdf_surf_grid
        self.global_params_values = global_params_values
        self.global_params_reference = global_params_reference
        self.pos_surface_center_of_mass = pos_surface_center_of_mass
        self.surface_mesh_centers = surface_mesh_centers
        self.surface_mesh_neighbors = surface_mesh_neighbors
        self.surface_normals = surface_normals
        self.surface_neighbors_normals = surface_neighbors_normals
        self.surface_areas = surface_areas
        self.surface_neighbors_areas = surface_neighbors_areas
    }

    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #endif
    public convenience init(geometry_coordinates: MLShapedArray<Float16>, surf_grid: MLShapedArray<Float16>, sdf_surf_grid: MLShapedArray<Float16>, global_params_values: MLShapedArray<Float16>, global_params_reference: MLShapedArray<Float16>, pos_surface_center_of_mass: MLShapedArray<Float16>, surface_mesh_centers: MLShapedArray<Float16>, surface_mesh_neighbors: MLShapedArray<Float16>, surface_normals: MLShapedArray<Float16>, surface_neighbors_normals: MLShapedArray<Float16>, surface_areas: MLShapedArray<Float16>, surface_neighbors_areas: MLShapedArray<Float16>) {
        self.init(geometry_coordinates: MLMultiArray(geometry_coordinates), surf_grid: MLMultiArray(surf_grid), sdf_surf_grid: MLMultiArray(sdf_surf_grid), global_params_values: MLMultiArray(global_params_values), global_params_reference: MLMultiArray(global_params_reference), pos_surface_center_of_mass: MLMultiArray(pos_surface_center_of_mass), surface_mesh_centers: MLMultiArray(surface_mesh_centers), surface_mesh_neighbors: MLMultiArray(surface_mesh_neighbors), surface_normals: MLMultiArray(surface_normals), surface_neighbors_normals: MLMultiArray(surface_neighbors_normals), surface_areas: MLMultiArray(surface_areas), surface_neighbors_areas: MLMultiArray(surface_neighbors_areas))
    }

}


/// Model Prediction Output Type
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public class NVIDIA_DoMINO_10M_DrivAerMLOutput : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// surface_aerodynamic_fields as 1 × 128 × 4 3-dimensional array of 16-bit floats
    public var surface_aerodynamic_fields: MLMultiArray {
        provider.featureValue(for: "surface_aerodynamic_fields")!.multiArrayValue!
    }

    /// surface_aerodynamic_fields as 1 × 128 × 4 3-dimensional array of 16-bit floats
    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #endif
    public var surface_aerodynamic_fieldsShapedArray: MLShapedArray<Float16> {
        MLShapedArray<Float16>(surface_aerodynamic_fields)
    }

    public var featureNames: Set<String> {
        provider.featureNames
    }

    public func featureValue(for featureName: String) -> MLFeatureValue? {
        provider.featureValue(for: featureName)
    }

    public init(surface_aerodynamic_fields: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["surface_aerodynamic_fields" : MLFeatureValue(multiArray: surface_aerodynamic_fields)])
    }

    public init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public class NVIDIA_DoMINO_10M_DrivAerML {
    public let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "NVIDIA_DoMINO_10M_DrivAerML", withExtension:"mlmodelc")!
    }

    /**
        Construct NVIDIA_DoMINO_10M_DrivAerML instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of NVIDIA_DoMINO_10M_DrivAerML.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `NVIDIA_DoMINO_10M_DrivAerML.urlOfModelInThisBundle` to create a MLModel object to pass-in.

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
        Construct NVIDIA_DoMINO_10M_DrivAerML instance with explicit path to mlmodelc file
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
        Construct NVIDIA_DoMINO_10M_DrivAerML instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_DoMINO_10M_DrivAerML, Error>) -> Void) {
        load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct NVIDIA_DoMINO_10M_DrivAerML instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    public class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_DoMINO_10M_DrivAerML {
        try await load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct NVIDIA_DoMINO_10M_DrivAerML instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<NVIDIA_DoMINO_10M_DrivAerML, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(NVIDIA_DoMINO_10M_DrivAerML(model: model)))
            }
        }
    }

    /**
        Construct NVIDIA_DoMINO_10M_DrivAerML instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    public class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> NVIDIA_DoMINO_10M_DrivAerML {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return NVIDIA_DoMINO_10M_DrivAerML(model: model)
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_DoMINO_10M_DrivAerMLInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_DoMINO_10M_DrivAerMLOutput
    */
    public func prediction(input: NVIDIA_DoMINO_10M_DrivAerMLInput) throws -> NVIDIA_DoMINO_10M_DrivAerMLOutput {
        try prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_DoMINO_10M_DrivAerMLInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_DoMINO_10M_DrivAerMLOutput
    */
    public func prediction(input: NVIDIA_DoMINO_10M_DrivAerMLInput, options: MLPredictionOptions) throws -> NVIDIA_DoMINO_10M_DrivAerMLOutput {
        let outFeatures = try model.prediction(from: input, options: options)
        return NVIDIA_DoMINO_10M_DrivAerMLOutput(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as NVIDIA_DoMINO_10M_DrivAerMLInput
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_DoMINO_10M_DrivAerMLOutput
    */
    public func prediction(input: NVIDIA_DoMINO_10M_DrivAerMLInput, options: MLPredictionOptions = MLPredictionOptions()) async throws -> NVIDIA_DoMINO_10M_DrivAerMLOutput {
        let outFeatures = try await model.prediction(from: input, options: options)
        return NVIDIA_DoMINO_10M_DrivAerMLOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - geometry_coordinates: 1 × 256 × 3 3-dimensional array of 16-bit floats
            - surf_grid: 1 × 128 × 64 × 64 × 3 5-dimensional array of 16-bit floats
            - sdf_surf_grid: 1 × 128 × 64 × 64 4-dimensional array of 16-bit floats
            - global_params_values: 1 by 2 matrix of 16-bit floats
            - global_params_reference: 1 by 2 matrix of 16-bit floats
            - pos_surface_center_of_mass: 1 × 128 × 3 3-dimensional array of 16-bit floats
            - surface_mesh_centers: 1 × 128 × 3 3-dimensional array of 16-bit floats
            - surface_mesh_neighbors: 1 × 128 × 7 × 3 4-dimensional array of 16-bit floats
            - surface_normals: 1 × 128 × 3 3-dimensional array of 16-bit floats
            - surface_neighbors_normals: 1 × 128 × 7 × 3 4-dimensional array of 16-bit floats
            - surface_areas: 1 by 128 matrix of 16-bit floats
            - surface_neighbors_areas: 1 × 128 × 7 3-dimensional array of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_DoMINO_10M_DrivAerMLOutput
    */
    public func prediction(geometry_coordinates: MLMultiArray, surf_grid: MLMultiArray, sdf_surf_grid: MLMultiArray, global_params_values: MLMultiArray, global_params_reference: MLMultiArray, pos_surface_center_of_mass: MLMultiArray, surface_mesh_centers: MLMultiArray, surface_mesh_neighbors: MLMultiArray, surface_normals: MLMultiArray, surface_neighbors_normals: MLMultiArray, surface_areas: MLMultiArray, surface_neighbors_areas: MLMultiArray) throws -> NVIDIA_DoMINO_10M_DrivAerMLOutput {
        let input_ = NVIDIA_DoMINO_10M_DrivAerMLInput(geometry_coordinates: geometry_coordinates, surf_grid: surf_grid, sdf_surf_grid: sdf_surf_grid, global_params_values: global_params_values, global_params_reference: global_params_reference, pos_surface_center_of_mass: pos_surface_center_of_mass, surface_mesh_centers: surface_mesh_centers, surface_mesh_neighbors: surface_mesh_neighbors, surface_normals: surface_normals, surface_neighbors_normals: surface_neighbors_normals, surface_areas: surface_areas, surface_neighbors_areas: surface_neighbors_areas)
        return try prediction(input: input_)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - geometry_coordinates: 1 × 256 × 3 3-dimensional array of 16-bit floats
            - surf_grid: 1 × 128 × 64 × 64 × 3 5-dimensional array of 16-bit floats
            - sdf_surf_grid: 1 × 128 × 64 × 64 4-dimensional array of 16-bit floats
            - global_params_values: 1 by 2 matrix of 16-bit floats
            - global_params_reference: 1 by 2 matrix of 16-bit floats
            - pos_surface_center_of_mass: 1 × 128 × 3 3-dimensional array of 16-bit floats
            - surface_mesh_centers: 1 × 128 × 3 3-dimensional array of 16-bit floats
            - surface_mesh_neighbors: 1 × 128 × 7 × 3 4-dimensional array of 16-bit floats
            - surface_normals: 1 × 128 × 3 3-dimensional array of 16-bit floats
            - surface_neighbors_normals: 1 × 128 × 7 × 3 4-dimensional array of 16-bit floats
            - surface_areas: 1 by 128 matrix of 16-bit floats
            - surface_neighbors_areas: 1 × 128 × 7 3-dimensional array of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as NVIDIA_DoMINO_10M_DrivAerMLOutput
    */

    #if (os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    #endif
    public func prediction(geometry_coordinates: MLShapedArray<Float16>, surf_grid: MLShapedArray<Float16>, sdf_surf_grid: MLShapedArray<Float16>, global_params_values: MLShapedArray<Float16>, global_params_reference: MLShapedArray<Float16>, pos_surface_center_of_mass: MLShapedArray<Float16>, surface_mesh_centers: MLShapedArray<Float16>, surface_mesh_neighbors: MLShapedArray<Float16>, surface_normals: MLShapedArray<Float16>, surface_neighbors_normals: MLShapedArray<Float16>, surface_areas: MLShapedArray<Float16>, surface_neighbors_areas: MLShapedArray<Float16>) throws -> NVIDIA_DoMINO_10M_DrivAerMLOutput {
        let input_ = NVIDIA_DoMINO_10M_DrivAerMLInput(geometry_coordinates: geometry_coordinates, surf_grid: surf_grid, sdf_surf_grid: sdf_surf_grid, global_params_values: global_params_values, global_params_reference: global_params_reference, pos_surface_center_of_mass: pos_surface_center_of_mass, surface_mesh_centers: surface_mesh_centers, surface_mesh_neighbors: surface_mesh_neighbors, surface_normals: surface_normals, surface_neighbors_normals: surface_neighbors_normals, surface_areas: surface_areas, surface_neighbors_areas: surface_neighbors_areas)
        return try prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - inputs: the inputs to the prediction as [NVIDIA_DoMINO_10M_DrivAerMLInput]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [NVIDIA_DoMINO_10M_DrivAerMLOutput]
    */
    public func predictions(inputs: [NVIDIA_DoMINO_10M_DrivAerMLInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [NVIDIA_DoMINO_10M_DrivAerMLOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [NVIDIA_DoMINO_10M_DrivAerMLOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  NVIDIA_DoMINO_10M_DrivAerMLOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
