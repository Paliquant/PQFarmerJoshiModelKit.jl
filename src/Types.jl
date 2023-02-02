# abstract agent model -
abstract type PQAbstractAgentModel end
abstract type PQAbstractGameModel end

# trader types -
mutable struct PQTrendFollowingTradingAgentModel <: PQAbstractAgentModel

    # data -
    tid::Int64
    capital::Float64
    timelag::Int64
   
    # constructor -
    PQTrendFollowingTradingAgentModel() = new()
end

mutable struct PQValueInvestorTradingAgentModel <: PQAbstractAgentModel

    # data -
    tid::Int64
    capital::Float64
    value::Float64
    
    # noise parameters -
    μ::Float64
    σ::Float64

    # constructor -
    PQValueInvestorTradingAgentModel() = new()
end

mutable struct PQFarmerJoshiGameModel <: PQAbstractGameModel

    # data -
    # ..

    # constructor -
    PQAbstractGameModel() = new()
end