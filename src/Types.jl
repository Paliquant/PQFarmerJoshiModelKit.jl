# abstract agent model -
abstract type PQAbstractAgentModel end
abstract type PQAbstractGameModel end

# trader types -
mutable struct PQTrendFollowingTradingAgentModel <: PQAbstractAgentModel

    # data -
    tid::Int64
    capital::Int64
    timelag::Int64
    position::Dict{Int64, Int64}
   
    # constructor -
    PQTrendFollowingTradingAgentModel() = new()
end

mutable struct PQValueInvestorTradingAgentModel <: PQAbstractAgentModel

    # data -
    tid::Int64
    capital::Int64
    value::Float64
    position::Dict{Int64, Int64}
    
    # noise model -
    μ::Float64 # not sure we need to store these
    σ::Float64 # not sure we need to store these
    η::Normal

    # constructor -
    PQValueInvestorTradingAgentModel() = new()
end

mutable struct PQFarmerJoshiGameModel <: PQAbstractGameModel

    # data -
    λ::Float64 # liquidity parameter
    p::Floai64 # initialize price of asset
    μ::Float64
    σ::Float64

    # constructor -
    PQFarmerJoshiGameModel() = new()
end