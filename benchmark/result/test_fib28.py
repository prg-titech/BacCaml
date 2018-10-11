def lift(lst):
    return map(lambda x: x / (10.0), lst)

res_fib28_mj = lift([
    70378,
    66750,
    65954,
    66867,
    225287,
    69215,
    68693,
    66366,
    66889,
    66769,
])

res_fib28_tj = lift([
    262464,
    363685,
    275144,
    341987,
    263741,
    259507,
    270912,
    338728,
    262890,
    256730,
])

res_fib28_interp = lift([
    342963,
    469814,
    363952,
    357174,
    410348,
    350911,
    343877,
    453715,
    344084,
    345615,
])

res_fib28_mincaml = lift([
    16723,
    17235,
    16414,
    16470,
    16666,
    16266,
    16240,
    23177,
    56694,
    90705,
])

res_fib28_c = [
    2231.0,
    2666.0,
    3195.0,
    2916.0,
    2327.0,
    2171.0,
    1986.0,
    2108.0,
    2033.0,
    2014.0
]

res_fib28_pypy = [
    10909.080505,
    7420.063019 ,
    7333.993912 ,
    6509.065628 ,
    8249.998093 ,
    7055.997849 ,
    6708.145142 ,
    8111.000061 ,
    5369.186401 ,
    8230.924606 ,
    5919.933319 ,
    6025.075912 ,
    7269.859314 ,
    5251.884460 ,
    11910.915375,
    6304.979324 ,
    11399.984360,
    8099.794388 ,
    8842.945099 ,
    6204.128265 ,
    7130.146027 ,
    5455.970764 ,
    9147.167206 ,
    7231.950760 ,
    10715.007782,
    7412.910461 ,
    13124.942780,
    6428.956985 ,
    7399.797440 ,
    5706.071854 ,
    10095.834732,
    8363.008499 ,
    8160.114288 ,
    5460.023880 ,
    8088.827133 ,
    8009.195328 ,
    8914.947510 ,
    8086.919785 ,
    8648.157120 ,
    6215.095520 ,
    11332.035065,
    7491.827011 ,
    8527.994156 ,
    7411.003113 ,
    8326.053619 ,
    9481.906891 ,
    9912.967682 ,
    7414.102554 ,
    9234.905243 ,
    7272.958755 ,
    8525.133133 ,
    7607.936859 ,
    8939.981461 ,
    7635.116577 ,
    8506.059647 ,
    7691.144943 ,
    9606.122971 ,
    7905.006409 ,
    8247.137070 ,
    8013.010025 ,
    8936.882019 ,
    10266.065598,
    7128.000259 ,
    7404.088974 ,
    8388.042450 ,
    7750.988007 ,
    8627.176285 ,
    7407.188416 ,
    9094.953537 ,
    7261.037827 ,
    8692.026138 ,
    7536.888123 ,
    8336.067200 ,
    7308.959961 ,
    8715.867996 ,
    7848.978043 ,
    8178.949356 ,
    7148.981094 ,
    8682.966232 ,
    6677.865982 ,
    10005.950928,
    6057.024002 ,
    9103.059769 ,
    6326.198578 ,
    9260.892868 ,
    6764.888763 ,
    7943.868637 ,
    7868.051529 ,
    8610.010147 ,
    8265.972137 ,
]
