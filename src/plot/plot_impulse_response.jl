"""
```
plot_impulse_response(m, shock, var, class, input_type, cond_type;
    title = "", kwargs...)

plot_impulse_response(m, shock, vars, class, input_type, cond_type;
    forecast_string = "", plotroot = figurespath(m, \"forecast\"),
    titles = [], kwargs...)
```

Plot the responses of `var` to `shock`. By default, only 90% bands are plotted.

### Inputs

- `m::AbstractDSGEModel`
- `shock::Symbol`: e.g. `:g_sh`
- `var::Symbol` or `vars::Vector{Symbol}`: response variable(s), e.g. `:obs_gdp`
- `class::Symbol`
- `input_type::Symbol`
- `cond_type::Symbol`

### Keyword Arguments

- `forecast_string::String`
- `plotroot::String`: if nonempty, plots will be saved in that directory
- `title::String` or `titles::Vector{String}`
- `verbose::Symbol`

See `?irf` for additional keyword arguments, all of which can be passed
into `plot_history_and_forecast`.

### Output

- `p::Plot` or `plots::OrderedDict{Symbol, Plot}`
"""
function plot_impulse_response(m::AbstractDSGEModel, shock::Symbol, var::Symbol, class::Symbol,
                               input_type::Symbol, cond_type::Symbol;
                               title::String = "",
                               kwargs...)

    plots = plot_impulse_response(m, shock, [var], class, input_type, cond_type;
                                  titles = isempty(title) ? String[] : [title],
                                  kwargs...)
    return plots[var]
end

function plot_impulse_response(m::AbstractDSGEModel, shock::Symbol, vars::Vector{Symbol}, class::Symbol,
                               input_type::Symbol, cond_type::Symbol;
                               input_type2::Symbol = Symbol(),
                               forecast_string::String = "",
                               plotroot::String = figurespath(m, "forecast"),
                               titles::Vector{String} = String[],
                               addl_text::String = "",
                               verbose::Symbol = :low,
                               kwargs...)
    # Read in MeansBands
    mb = read_mb(m, input_type, cond_type, Symbol(:irf, class), forecast_string = forecast_string)
    if input_type2 != Symbol()
        mb2 = read_mb(m, input_type2, cond_type, Symbol(:irf, class), forecast_string = forecast_string)
    else
        mb2 = MeansBands()
    end
    # Get titles if not provided
    if isempty(titles)
        detexify_title = typeof(Plots.backend()) == Plots.GRBackend
        titles = map(var -> describe_series(m, var, class, detexify = detexify_title), vars)
    end

    # Loop through variables
    plots = OrderedDict{Symbol, Plots.Plot}()
    for (var, title) in zip(vars, titles)
        # Call recipe
        plots[var] = irf(shock, var, mb, mb2; title = title, input_type = input_type, input_type2 = input_type2, kwargs...)

        # Save plot
        if !isempty(plotroot)
            output_file = get_forecast_filename(plotroot, filestring_base(m), input_type, cond_type,
                                                Symbol("irf_", detexify(shock), "_", string(detexify(var)) * addl_text),
                                                forecast_string = forecast_string,
                                                fileformat = plot_extension())
            save_plot(plots[var], output_file, verbose = verbose)
        end
    end
    return plots
end

# Plots two IRFs on the same plot, with which_model indicating which
# model to use for things like where to save these plots and which model to use
# to grab descriptions of series.
function plot_impulse_response(m1::AbstractDSGEModel, m2::AbstractDSGEModel,
                               shock::Symbol, vars::Vector{Symbol}, class::Symbol,
                               input_type1::Symbol, input_type2::Symbol,
                               cond_type1::Symbol, cond_type2::Symbol;
                               forecast_string1::String = "",
                               forecast_string2::String = "",
                               bands_color1::Symbol = :blue,
                               bands_color2::Symbol = :red,
                               bands_alpha1::Float64 = 0.1,
                               bands_alpha2::Float64 = 0.1,
                               bands_pcts::Vector{String} = Vector{String}(undef,0),
                               which_model::Int = 1,
                               plotroot::String =
                               figurespath((which_model == 1) ? m1 : m2, "forecast"),
                               titles::Vector{String} = String[],
                               addl_text::String = "",
                               verbose::Symbol = :low,
                               kwargs...)
    # Read in MeansBands
    mb1 = read_mb(m1, input_type1, cond_type1, Symbol(:irf, class), forecast_string = forecast_string1)
    mb2 = read_mb(m2, input_type2, cond_type2, Symbol(:irf, class), forecast_string = forecast_string2)

    # Get titles if not provided
    if isempty(titles)
        detexify_title = typeof(Plots.backend()) == Plots.GRBackend
        titles = map(var -> describe_series((which_model == 1) ? m1 : m2, var, class, detexify = detexify_title), vars)
    end

    # Loop through variables
    plots = OrderedDict{Symbol, Plots.Plot}()
    for (var, title) in zip(vars, titles)
        # Call recipe
        if isempty(bands_pcts)
            bands_pcts = which_density_bands((which_model == 1) ? mb1 : mb2, uniquify = true)
        end
        plots[var] = irf(shock, var, mb1, MeansBands();
                         title = title, input_type = input_type1, input_type2 = Symbol(),
                         bands_color = bands_color1, bands_alpha = bands_alpha1,
                         bands_pcts = bands_pcts, mean_color = bands_color1, kwargs...)
        irf!(shock, var, mb2, MeansBands();
             title = title, input_type = input_type2, input_type2 = Symbol(),
             bands_color = bands_color2, bands_alpha = bands_alpha2,
             bands_pcts = bands_pcts, mean_color = bands_color2, kwargs...)

        # Save plot
        if !isempty(plotroot)
            output_file = get_forecast_filename(plotroot, filestring_base((which_model == 1) ? m1 : m2),
                                                (which_model == 1) ? input_type1 : input_type2,
                                                (which_model == 1) ? cond_type1 : cond_type2,
                                                Symbol("irf_", detexify(shock), "_", detexify(var), addl_text),
                                                forecast_string = (which_model == 1) ?
                                                forecast_string1 : forecast_string2,
                                                fileformat = plot_extension())
            save_plot(plots[var], output_file, verbose = verbose)
        end
    end
    return plots
end

@userplot Irf

"""
```
irf(shock, var, mb; flip_sign = false, label_mean_bands = false,
    mean_color = :black, bands_color = :blue, bands_pcts = [\"90.0%\"])
```

User recipe called by `plot_impulse_response`.

### Inputs

- `shock::Symbol`: e.g. `:g_sh`
- `var::Symbol`: e.g. `:obs_gdp`
- `mb::MeansBands`

### Keyword Arguments

- `flip_sign::Bool`: whether to flip the sign of the impulse response while
  plotting
- `label_mean_bands::Bool`
- `mean_color`
- `bands_color`
- `bands_pcts::Vector{String}`

Additionally, all Plots attributes (see docs.juliaplots.org/latest/attributes)
are supported as keyword arguments.
"""
irf
@recipe function f(irf::Irf;
                   flip_sign = false,
                   label_mean_bands = false,
                   mean_color = :black,
                   bands_color = :blue,
                   bands_alpha = 0.1,
                   bands_pcts = which_density_bands(irf.args[3], uniquify = true),
                   input_type = Symbol(),
                   input_type2 = Symbol())
    # Error checking
  #=  if length(irf.args) != 3 || typeof(irf.args[1]) != Symbol || typeof(irf.args[2]) != Symbol ||
        typeof(irf.args[3]) != MeansBands

        error("irf must be given two Symbols and a MeansBands. Got $(typeof(irf.args))")
    end=#
    shock, var, mb, mb2 = irf.args

    varshock = Symbol(var, "__", shock)
    sign = flip_sign ? -1 : 1
    quarters_ahead = collect(1:size(mb.means,1))

    quarters_ahead = collect(1:size(mb.means,1))
    # Bands
   for pct in bands_pcts
        @series begin
            fillcolor := bands_color
            fillalpha := bands_alpha
            linealpha := 0
            label     := label_mean_bands ? "$pct Bands" : ""
            fillrange := sign * mb.bands[varshock][!,Symbol(pct, " UB")]
            quarters_ahead, sign * mb.bands[varshock][!,Symbol(pct, " LB")]
        end
    end

    # Mean
    @series begin
        label     := label_mean_bands ? "Mean"*string(input_type) : ""
        linewidth := 2
        linecolor := mean_color
        quarters_ahead, sign * mb.means[!, varshock]
    end

   #= if input_type2 != Symbol()
        @series begin
            label     := label_mean_bands ? "Mean"*string(input_type2) : ""
            linewidth := 2
            linecolor := :blue
            quarters_ahead, sign * mb2.means[varshock]
        end
    end =#
end
