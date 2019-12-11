function build_lambda(y_size::Int64)
    λ = Array{Float64}(undef, y_size, y_size)
    if y_size == 30
        λ = [-0.83533612 0.014477463 0.79244709 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.0015233196 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0 0.0011365783 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.0011365784 -0.83341414 0.0 0.011937726 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.0015233196 0.79244709 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0011365783 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.024511464 0.0 -0.067400493 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.014477463 0.024511464 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0011365783 0.0 0.0;
             0.0011365784 0.0015233196 0.0 -0.83312459 0.010219256 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.0015233196 0.0 0.0 0.79244709 0.0 0.0 0.0 0.0 0.0 0.0011365783 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.0011365784 0.0015233196 0.0 0.00051882295 -0.83284759 0.009430315 6.8793952e-6 9.4399775e-5 0.000518823 0.0015233196 0.0 0.0 0.0 0.79244709 0.0 0.0 0.0 0.0 0.0011365783 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.0011365784 0.0015233196 0.0 0.00051882295 9.4399749e-5 -0.82820667 0.0047018731 9.4399775e-5 0.000518823 0.0015233196 0.0 0.0 0.0 0.0 0.79244709 0.0 0.0 0.0 0.0011365783 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0;
             0.0011365784 0.0015233196 0.0 0.00051882295 9.4399749e-5 0.004701886 -0.82820668 9.4399775e-5 0.000518823 0.0015233196 0.0 0.0 0.0 0.0 0.0 0.79244709 0.0 0.0 0.0011365783 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0;
             0.0011365784 0.0015233196 0.0 0.00051882295 9.4399749e-5 6.879389e-6 0.0094303151 -0.83284759 0.000518823 0.0015233196 0.0 0.0 0.0 0.0 0.0 0.0 0.79244709 0.0 0.0011365783 0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0;
             0.0011365784 0.0015233196 0.0 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 0.010219256 -0.83312459 0.0015233196 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.79244709 0.0011365783 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0;
             0.0011365784 0.0015233196 0.0 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.011937727 -0.83341414 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0011365783 0.79244709 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0;
             0.0 0.024511464 0.0011365784 0.0 0.0 0.0 0.0 0.0 0.0 0.0 -0.065478512 0.0 0.011937726 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.0 0.0015233196 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0 0.0011365783 0.0 0.0;
             0.024511464 0.0 0.79244709 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 -0.83533612 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.014477463 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0011365783;
             0.0 0.0 0.0011365784 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0 0.0015233196 0.0 -0.065188961 0.010219256 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0011365783 0.0 0.0;
             0.0 0.0 0.0011365784 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0015233196 0.0 0.00051882295 -0.064911964 0.009430315 6.8793952e-6 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0011365783 0.0 0.0;
             0.0 0.0 0.0011365784 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0015233196 0.0 0.00051882295 9.4399749e-5 -0.060271042 0.0047018731 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0011365783 0.0 0.0;
             0.0 0.0 0.0011365784 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0015233196 0.0 0.00051882295 9.4399749e-5 0.004701886 -0.060271055 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0011365783 0.0 0.0;
             0.0 0.0 0.0011365784 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0015233196 0.0 0.00051882295 9.4399749e-5 6.879389e-6 0.0094303151 -0.064911964 0.000518823 0.0 0.0015233196 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0011365783 0.0 0.0;
             0.0 0.0 0.0011365784 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0015233196 0.0 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 0.010219256 -0.065188961 0.0 0.0015233196 0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0011365783 0.0 0.0;
             0.0011365784 0.0015233196 0.0 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.014477463 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 -0.83533612 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.79244709 0.0 0.024511464;
             0.0 0.0 0.0011365784 0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0015233196 0.0 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.011937727 0.0 -0.065478512 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0011365783 0.024511464 0.0;
             0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.79244709 0.0011365784 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 -0.83341414 0.011937726 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0011365783;
             0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0011365784 0.79244709 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0015233196 -0.83312459 0.010219256 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0011365783;
             0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0 0.0011365784 0.0 0.79244709 0.0 0.0 0.0 0.0 0.0 0.0 0.0015233196 0.00051882295 -0.83284759 0.009430315 6.8793952e-6 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0011365783;
             0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0 0.0011365784 0.0 0.0 0.79244709 0.0 0.0 0.0 0.0 0.0 0.0015233196 0.00051882295 9.4399749e-5 -0.82820667 0.0047018731 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0011365783;
             0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0 0.0011365784 0.0 0.0 0.0 0.79244709 0.0 0.0 0.0 0.0 0.0015233196 0.00051882295 9.4399749e-5 0.004701886 -0.82820668 9.4399775e-5 0.000518823 0.0 0.0015233196 0.0011365783;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0 0.0011365784 0.0 0.0 0.0 0.0 0.79244709 0.0 0.0 0.0 0.0015233196 0.00051882295 9.4399749e-5 6.879389e-6 0.0094303151 -0.83284759 0.000518823 0.0 0.0015233196 0.0011365783;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0 0.0011365784 0.0 0.0 0.0 0.0 0.0 0.79244709 0.0 0.0 0.0015233196 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 0.010219256 -0.83312459 0.0 0.0015233196 0.0011365783;
             0.0 0.0 0.0011365784 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0015233196 0.0 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.024511464 0.014477463 0.0 0.0 0.0 0.0 0.0 0.0 0.0 -0.067400493 0.0 0.024511464;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0011365784 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.79244709 0.0015233196 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.011937727 0.0 -0.83341414 0.0011365783;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0011365784 0.0 0.0 0.0 0.0 0.0 0.0 0.024511464 0.0 0.0015233196 0.00051882295 9.4399749e-5 6.879389e-6 6.8793952e-6 9.4399775e-5 0.000518823 0.79244709 0.014477463 -0.83533612]

    elseif y_size == 33
        λ = [-0.85623069505 0.032502463 0.00078435813 0.79470408 0.0008046192 0.00057385784 0.0 0.00039669164 0.00057385784 0.0 0.0008046192 0.023382971 0.0 0.00078435813 0.0 0.0 0.0 0.0005540046 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.00036481447 -0.85006657839 0.02675789 0.0 0.0008046192 0.00057385784 0.79470408 0.00039669164 0.00057385784 0.0 0.0008046192 0.0 0.0 0.00078435813 0.0 0.023382971 0.0 0.0005540046 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.00036481447 0.0005540046 -0.8438983407899999 0.0 0.020840267 0.00057385784 0.0 0.00039669164 0.00057385784 0.79470408 0.0008046192 0.0 0.0 0.00078435813 0.0 0.0 0.0 0.0005540046 0.0 0.023382971 0.0 0.00036481447 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.023382971 0.0 0.0 -0.08490958605 0.0 0.0 0.032502463 0.0 0.0 0.00078435813 0.0 0.023382971 0.0008046192 0.0 0.00057385784 0.0 0.00039669164 0.0 0.00057385784 0.0 0.0008046192 0.0 0.0 0.00078435813 0.0 0.0 0.0005540046 0.0 0.0 0.00036481447 0.0 0.0 0.0;
             0.00036481447 0.0005540046 0.00078435813 0.0 -0.83805346908 0.014784895 0.0 0.00039669164 0.00057385784 0.0 0.0008046192 0.0 0.79470408 0.00078435813 0.0 0.0 0.0 0.0005540046 0.0 0.0 0.0 0.00036481447 0.023382971 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.00036481447 0.0005540046 0.00078435813 0.0 0.0008046192 -0.83346319354 0.0 0.0097866919 0.00057385784 0.0 0.0008046192 0.0 0.0 0.00078435813 0.79470408 0.0 0.0 0.0005540046 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.023382971 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.0 0.023382971 0.0 0.00036481447 0.0 0.0 -0.07874546938999999 0.0 0.0 0.02675789 0.0 0.0 0.0008046192 0.0 0.00057385784 0.023382971 0.00039669164 0.0 0.00057385784 0.0 0.0008046192 0.0 0.0 0.00078435813 0.0 0.0 0.0005540046 0.0 0.0 0.00036481447 0.0 0.0 0.0;
             0.00036481447 0.0005540046 0.00078435813 0.0 0.0008046192 0.00057385784 0.0 -0.8242503594799999 0.00057385784 0.0 0.0008046192 0.0 0.0 0.00078435813 0.0 0.0 0.79470408 0.0005540046 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0 0.023382971 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
             0.00036481447 0.0005540046 0.00078435813 0.0 0.0008046192 0.00057385784 0.0 0.0097866919 -0.83346319354 0.0 0.0008046192 0.0 0.0 0.00078435813 0.0 0.0 0.0 0.0005540046 0.79470408 0.0 0.0 0.00036481447 0.0 0.0 0.0 0.0 0.0 0.023382971 0.0 0.0 0.0 0.0 0.0;
             0.0 0.0 0.023382971 0.00036481447 0.0 0.0 0.0005540046 0.0 0.0 -0.07257723178999999 0.0 0.0 0.020840267 0.0 0.00057385784 0.0 0.00039669164 0.0 0.00057385784 0.023382971 0.0008046192 0.0 0.0 0.00078435813 0.0 0.0 0.0005540046 0.0 0.0 0.00036481447 0.0 0.0 0.0;
             0.00036481447 0.0005540046 0.00078435813 0.0 0.0008046192 0.00057385784 0.0 0.00039669164 0.014784895 0.0 -0.83805346908 0.0 0.0 0.00078435813 0.0 0.0 0.0 0.0005540046 0.0 0.0 0.79470408 0.00036481447 0.0 0.0 0.0 0.0 0.0 0.0 0.023382971 0.0 0.0 0.0 0.0;
             0.023382971 0.0 0.0 0.79470408 0.0 0.0 0.0 0.0 0.0 0.0 0.0 -0.85623069505 0.0 0.0 0.0 0.032502463 0.0 0.0 0.0 0.00078435813 0.0 0.0 0.0008046192 0.0 0.00057385784 0.00039669164 0.0 0.00057385784 0.0008046192 0.0 0.00078435813 0.0005540046 0.00036481447;
             0.0 0.0 0.0 0.00036481447 0.023382971 0.0 0.0005540046 0.0 0.0 0.00078435813 0.0 0.0 -0.06673236008 0.0 0.014784895 0.0 0.00039669164 0.0 0.00057385784 0.0 0.0008046192 0.0 0.023382971 0.00078435813 0.0 0.0 0.0005540046 0.0 0.0 0.00036481447 0.0 0.0 0.0;
             0.00036481447 0.0005540046 0.00078435813 0.0 0.0008046192 0.00057385784 0.0 0.00039669164 0.00057385784 0.0 0.020840267 0.0 0.0 -0.84389834079 0.0 0.0 0.0 0.0005540046 0.0 0.0 0.0 0.00036481447 0.0 0.79470408 0.0 0.0 0.0 0.0 0.0 0.0 0.023382971 0.0 0.0;
             0.0 0.0 0.0 0.00036481447 0.0 0.023382971 0.0005540046 0.0 0.0 0.00078435813 0.0 0.0 0.0008046192 0.0 -0.062142084539999996 0.0 0.0097866919 0.0 0.00057385784 0.0 0.0008046192 0.0 0.0 0.00078435813 0.023382971 0.0 0.0005540046 0.0 0.0 0.00036481447 0.0 0.0 0.0;
             0.0 0.023382971 0.0 0.0 0.0 0.0 0.79470408 0.0 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0 -0.85006657839 0.0 0.0 0.0 0.02675789 0.0 0.0 0.0008046192 0.0 0.00057385784 0.00039669164 0.0 0.00057385784 0.0008046192 0.0 0.00078435813 0.0005540046 0.00036481447;
             0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0005540046 0.023382971 0.0 0.00078435813 0.0 0.0 0.0008046192 0.0 0.00057385784 0.0 -0.052929250479999995 0.0 0.00057385784 0.0 0.0008046192 0.0 0.0 0.00078435813 0.0 0.023382971 0.0005540046 0.0 0.0 0.00036481447 0.0 0.0 0.0;
             0.00036481447 0.0005540046 0.00078435813 0.0 0.0008046192 0.00057385784 0.0 0.00039669164 0.00057385784 0.0 0.0008046192 0.0 0.0 0.02675789 0.0 0.0 0.0 -0.85006657839 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0 0.0 0.79470408 0.0 0.0 0.0 0.0 0.023382971 0.0;
             0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0005540046 0.0 0.023382971 0.00078435813 0.0 0.0 0.0008046192 0.0 0.00057385784 0.0 0.0097866919 0.0 -0.062142084539999996 0.0 0.0008046192 0.0 0.0 0.00078435813 0.0 0.0 0.0005540046 0.023382971 0.0 0.00036481447 0.0 0.0 0.0;
             0.0 0.0 0.023382971 0.0 0.0 0.0 0.0 0.0 0.0 0.79470408 0.0 0.00036481447 0.0 0.0 0.0 0.0005540046 0.0 0.0 0.0 -0.84389834079 0.0 0.0 0.020840267 0.0 0.00057385784 0.00039669164 0.0 0.00057385784 0.0008046192 0.0 0.00078435813 0.0005540046 0.00036481447;
             0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0005540046 0.0 0.0 0.00078435813 0.023382971 0.0 0.0008046192 0.0 0.00057385784 0.0 0.00039669164 0.0 0.014784895 0.0 -0.06673236008 0.0 0.0 0.00078435813 0.0 0.0 0.0005540046 0.0 0.023382971 0.00036481447 0.0 0.0 0.0;
             0.00036481447 0.0005540046 0.00078435813 0.0 0.0008046192 0.00057385784 0.0 0.00039669164 0.00057385784 0.0 0.0008046192 0.0 0.0 0.00078435813 0.0 0.0 0.0 0.032502463 0.0 0.0 0.0 -0.85623069505 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.79470408 0.0 0.0 0.023382971;
             0.0 0.0 0.0 0.0 0.023382971 0.0 0.0 0.0 0.0 0.0 0.0 0.00036481447 0.79470408 0.0 0.0 0.0005540046 0.0 0.0 0.0 0.00078435813 0.0 0.0 -0.83805346908 0.0 0.014784895 0.00039669164 0.0 0.00057385784 0.0008046192 0.0 0.00078435813 0.0005540046 0.00036481447;
             0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0005540046 0.0 0.0 0.00078435813 0.0 0.0 0.0008046192 0.023382971 0.00057385784 0.0 0.00039669164 0.0 0.00057385784 0.0 0.020840267 0.0 0.0 -0.07257723179 0.0 0.0 0.0005540046 0.0 0.0 0.00036481447 0.023382971 0.0 0.0;
             0.0 0.0 0.0 0.0 0.0 0.023382971 0.0 0.0 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.79470408 0.0005540046 0.0 0.0 0.0 0.00078435813 0.0 0.0 0.0008046192 0.0 -0.83346319354 0.0097866919 0.0 0.00057385784 0.0008046192 0.0 0.00078435813 0.0005540046 0.00036481447;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.023382971 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0 0.0005540046 0.79470408 0.0 0.0 0.00078435813 0.0 0.0 0.0008046192 0.0 0.00057385784 -0.8242503594799999 0.0 0.00057385784 0.0008046192 0.0 0.00078435813 0.0005540046 0.00036481447;
             0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0005540046 0.0 0.0 0.00078435813 0.0 0.0 0.0008046192 0.0 0.00057385784 0.0 0.00039669164 0.023382971 0.00057385784 0.0 0.0008046192 0.0 0.0 0.02675789 0.0 0.0 -0.07874546938999999 0.0 0.0 0.00036481447 0.0 0.023382971 0.0;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.023382971 0.0 0.0 0.00036481447 0.0 0.0 0.0 0.0005540046 0.0 0.0 0.79470408 0.00078435813 0.0 0.0 0.0008046192 0.0 0.00057385784 0.0097866919 0.0 -0.83346319354 0.0008046192 0.0 0.00078435813 0.0005540046 0.00036481447;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.023382971 0.00036481447 0.0 0.0 0.0 0.0005540046 0.0 0.0 0.0 0.00078435813 0.79470408 0.0 0.0008046192 0.0 0.00057385784 0.00039669164 0.0 0.014784895 -0.83805346908 0.0 0.00078435813 0.0005540046 0.00036481447;
             0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0005540046 0.0 0.0 0.00078435813 0.0 0.0 0.0008046192 0.0 0.00057385784 0.0 0.00039669164 0.0 0.00057385784 0.0 0.0008046192 0.023382971 0.0 0.00078435813 0.0 0.0 0.032502463 0.0 0.0 -0.08490958605 0.0 0.0 0.023382971;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.00036481447 0.0 0.023382971 0.0 0.0005540046 0.0 0.0 0.0 0.00078435813 0.0 0.0 0.0008046192 0.79470408 0.00057385784 0.00039669164 0.0 0.00057385784 0.020840267 0.0 -0.8438983407899999 0.0005540046 0.00036481447;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0 0.0005540046 0.0 0.023382971 0.0 0.00078435813 0.0 0.0 0.0008046192 0.0 0.00057385784 0.00039669164 0.79470408 0.00057385784 0.0008046192 0.0 0.02675789 -0.85006657839 0.00036481447;
             0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.00036481447 0.0 0.0 0.0 0.0005540046 0.0 0.0 0.0 0.00078435813 0.0 0.023382971 0.0008046192 0.0 0.00057385784 0.00039669164 0.0 0.00057385784 0.0008046192 0.79470408 0.00078435813 0.032502463 -0.85623069505]
    end
    return λ
end