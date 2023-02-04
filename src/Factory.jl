"""
    build(trader_model_type::Type{T},  
        options::Dict{String,Any}) -> PQAbstractAgentModel where T<:PQAbstractAgentModel

Builds a trader agent model using the data stored in the options dictionary
"""
function build(trader_model_type::Type{T},  
    options::Dict{String,Any})::PQAbstractAgentModel where T<:PQAbstractAgentModel

    # initialize -
    model = eval(Meta.parse("$(trader_model_type)()")) # empty trader model -

    # for the result of the fields, let's lookup in the dictionary.
    # error state: if the dictionary is missing a value -
    for field_name_symbol ∈ fieldnames(trader_model_type)
        
        # skip apikey - we already set that
        if (field_name_symbol != :apikey)
            
            # convert the field_name_symbol to a string -
            field_name_string = string(field_name_symbol)
        
            # check the for the key -
            if (haskey(options,field_name_string) == false)
                throw(ArgumentError("dictionary is missing: $(field_name_string)"))    
            end

            # get the value -
            value = options[field_name_string]

            # set -
            setproperty!(model,field_name_symbol,value)
        end
    end

    # return -
    return model
end

"""
    build(game_model_type::Type{T},  
        options::Dict{String,Any}) -> PQAbstractGameModel where T<:PQAbstractGameModel

Builds a game model using the data stored in the options dictionary
"""
function build(game_model_type::Type{T},  
    options::Dict{String,Any})::PQAbstractGameModel where T<:PQAbstractGameModel

    # initialize -
    model = eval(Meta.parse("$(game_model_type)()")) # empty game model -

    # for the result of the fields, let's lookup in the dictionary.
    # error state: if the dictionary is missing a value -
    for field_name_symbol ∈ fieldnames(game_model_type)
        
        # skip apikey - we already set that
        if (field_name_symbol != :apikey)
            
            # convert the field_name_symbol to a string -
            field_name_string = string(field_name_symbol)
        
            # check the for the key -
            if (haskey(options,field_name_string) == false)
                throw(ArgumentError("dictionary is missing: $(field_name_string)"))    
            end

            # get the value -
            value = options[field_name_string]

            # set -
            setproperty!(model,field_name_symbol,value)
        end
    end

    # return -
    return model
end

"""
    build(type::Type{PQTrendFollowingTradingAgentModel}; 
        tid::Int64 = 0, capital::Int64 = 100, timelag::Int64 = 0) -> PQTrendFollowingTradingAgentModel

Builds a trend following agent of type `PQTrendFollowingTradingAgentModel`
"""
function build(type::Type{PQTrendFollowingTradingAgentModel}; 
    tid::Int64 = 0, capital::Int64 = 100, timelag::Int64 = 0)::PQTrendFollowingTradingAgentModel

    # build agent -
    agent = PQTrendFollowingTradingAgentModel();
    agent.tid = tid
    agent.capital = capital
    agent.timelag = timelag

    # return -
    return agent
end

function build(type::Type{PQValueInvestorTradingAgentModel};
    tid::Int64 = 0, capital::Int64 = 100, value::Float64 = 100.0, μ::Float64 = 0.0, σ::Float64 = 1.0)::PQValueInvestorTradingAgentModel

    # build agent -
    agent = PQValueInvestorTradingAgentModel()
    agent.tid = tid
    agent.capital = capital
    agent.value = value
    agent.μ = μ
    agent.σ = σ
    agent.η = Normal(μ,σ)

    # return -
    return agent
end