function _trade(agent::PQTrendFollowingTradingAgentModel, price::Float64)
end

function _trade(agent::PQValueInvestorTradingAgentModel, price::Float64)
end


function play(model::PQFarmerJoshiGameModel; 
    number_trend_followers::Int64 = 100, number_value_investors::Int64 = 100, 
    number_time_steps::Int64=100, maxtimelag::Int64 = 10, maxtransactionsize::Int64=100, price::Float64 = 4.0)::Tuple

    # initialize -
    agents = Dict{Int64, PQAbstractAgentModel}()
    prices = Array{Float64,1}(undef, number_of_time_steps+1);
    λ = model.λ
    ϵ = Normal(model.μ, model.σ); # noise in the price model -

    # set initial price -
    prices[1] = price

    # initialize trend agents -
    tid = 1;
    for i ∈ 1:number_trend_followers

        # build and store a trend follower model -
        agents[tid] = build(PQTrendFollowingTradingAgentModel; tid = tid, capital = rand(1:maxtransactionsize), timelag = rand(1:maxtimelag))

        # update tid -
        tid = tid + 1;
    end

    # initialize value agents -
    for i ∈ 1:number_value_investors

        # generate a value -
        θ = rand()
        p₁ = 0.8*price
        p₂ = 1.2*price
        vᵢ = θ*p₁ + (1-θ)*p₂

        # build and store value agent model -
        agents[tid] = build(PQValueInvestorTradingAgentModel; tid = tid, capital = rand(1:maxtransactionsize), value = vᵢ)

        # update tid -
        tid = tid + 1;
    end

    # main loop -
    number_of_agents = (number_trend_followers + number_value_investors)
    for i ∈ 2:number_time_steps 
    end
end