def lift(lst):
    return map(lambda x: x / (1000000 * 10.0), lst)

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
    0.022769,
    0.019927,
    0.027465,
    0.029472,
    0.038962,
    0.031057,
    0.021119,
    0.021065,
    0.019917,
    0.020878
]

res_fib28_pypy = [
    0.031678,
    0.008687,
    0.011740,
    0.018763,
    0.018815,
    0.013562,
    0.013300,
    0.020158,
    0.022964,
    0.009054,
    0.009369,
    0.014258,
    0.012381,
    0.009758,
    0.008913,
    0.006519,
    0.006263,
    0.005887,
    0.017646,
    0.013992,
    0.008097,
    0.008012,
    0.008849,
    0.022187,
    0.017034,
    0.006466,
    0.006351,
    0.006263,
    0.006225,
    0.013311,
    0.009608,
    0.012000,
    0.006467,
    0.006231,
    0.005636,
    0.006720,
    0.012830,
    0.007664,
    0.011068,
    0.009004,
    0.008351,
    0.006171,
    0.006186,
    0.006055,
    0.012354,
    0.007408,
    0.007848,
    0.010750,
    0.006900,
    0.006068,
]
