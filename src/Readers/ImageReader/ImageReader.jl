# For now we really don't have this function do anything else other than load
# We eventually want to load
# Zoom level
# FPS
#Size
function readImage(::Type{T}, filename; sampling_rate = 2.96, chName = "CalBryte590", chUnit = "px", chGain = 1.0) where T <: Real
     data_array = load(filename) |> Array{T}
     px_x, px_y, n_frames = size(data_array)
     HeaderDict = Dict( 
          "framesize" => (px_x, px_y),
          "xrng" => 1:px_x, "y_rng" => 1:px_y,
          "detector_wavelength" => [594],
     ) #We need to think of other important data aspects
     #Resize the data so that all of the pixels are in single value
     resize_data_arr = reshape(data_array, px_x*px_y, n_frames, 1)
     dt = 1/sampling_rate
     t = collect(1:n_frames) .* dt
     return Experiment(
          TWO_PHOTON,
          HeaderDict, #Header and Metadata
          dt, t, 
          resize_data_arr,
          [chName], 
          [chUnit], 
          [chGain], #Gain is always 1.0
          StimulusProtocol()
     )
end

readImage(filename; kwargs...) = readImage(Float64, filename; kwargs...)


function get_frame(exp::Experiment{})



end