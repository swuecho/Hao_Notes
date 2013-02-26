# vector

A vectior is a one dimensional array of n numbers.

```julia
julia> x1 = [1:10]
10-element Int32 Array:
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10

julia> x2 = [11:20]
10-element Int32 Array:
 11
 12
 13
 14
 15
 16
 17
 18
 19
 20

julia> x4 = x1 + 20
10-element Int32 Array:
 21
 22
 23
 24
 25
 26
 27
 28
 29
 30

julia> x3 = x1 + x2
10-element Int32 Array:
 12
 14
 16
 18
 20
 22
 24
 26
 28
 30
julia> length(x1)
10

julia> ndims(x1)
1
julia> x1_t = x1'
1x10 Int32 Array:
 1  2  3  4  5  6  7  8  9  10

julia> ndims(x1_t)
2
julia> size(x1)
(10,)

julia> size(x1_t)
(1,10)

```

### Vector multiplication
```julia
julia> x1
10-element Int32 Array:
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10

julia> x2 = 4 * x1
10-element Int32 Array:
  4
  8
 12
 16
 20
 24
 28
 32
 36
 40
julia> x1 .* x2
10-element Int32 Array:
   4
  16
  36
  64
 100
 144
 196
 256
 324
 400

julia> x1 * x2
ERROR: no method *(Array{Int32,1},Array{Int32,1})

julia> x1 * x2'
10x10 Int32 Array:
  4   8   12   16   20   24   28   32   36   40
  8  16   24   32   40   48   56   64   72   80
 12  24   36   48   60   72   84   96  108  120
 16  32   48   64   80   96  112  128  144  160
 20  40   60   80  100  120  140  160  180  200
 24  48   72   96  120  144  168  192  216  240
 28  56   84  112  140  168  196  224  252  280
 32  64   96  128  160  192  224  256  288  320
 36  72  108  144  180  216  252  288  324  360
 40  80  120  160  200  240  280  320  360  400

julia> 

```
## Simple statistics using vectors

```julia

julia> v
10-element Int32 Array:
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10

julia> one = ones(Int32,length(v))
10-element Int32 Array:
 1
 1
 1
 1
 1
 1
 1
 1
 1
 1

julia> v
10-element Int32 Array:
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10

julia> sum_v = one' * v
1-element Int32 Array:
 55

julia> mean(v)
5.5

julia> sum(x)
216

julia> sum(v)
55

julia> std(v)
3.0276503540974917

julia> var(v)
9.166666666666666


```
## combineing vector

Concatenation

Arrays can be concatenated along any dimension using the following syntax:

* cat(dim, A...) — concatenate input n-d arrays along the dimension dim
* vcat(A...) — Shorthand for cat(1, A...)
* hcat(A...) — Shorthand for cat(2, A...)
* hvcat(A...)
* Concatenation operators may also be used for concatenating arrays:

* [A B C ...] — calls hcat
* [A, B, C, ...] — calls vcat
* [A B; C D; ...] — calls hvcat

```julia

julia> x1 = [1:4]
4-element Int32 Array:
 1
 2
 3
 4

julia> x2 = [2:5]
4-element Int32 Array:
 2
 3
 4
 5

julia> [x1,x2]
8-element Int32 Array:
 1
 2
 3
 4
 2
 3
 4
 5

julia> [x1 x2]
4x2 Int32 Array:
 1  2
 2  3
 3  4
 4  5

julia> 
julia> inv(x)
ERROR: Multiplicative identity only defined for square matrices!
 in one at array.jl:202
 in inv at linalg.jl:98

julia> x*x'
4x4 Int32 Array:
 1780  2204  2032  2448
 2204  2729  2516  3031
 2032  2516  2320  2796
 2448  3031  2796  3373

julia> inv(x*x')
4x4 Float64 Array:
  3.0399e13   -2.23953e13  -2.51508e12   1.469e11  
 -2.23953e13   1.7434e13    4.28935e11   2.31826e11
 -2.51508e12   4.28935e11   2.37638e12  -5.29955e11
  1.469e11     2.31826e11  -5.29955e11   1.24364e11

julia> 

```
# svd and eig

``` julia

julia> a=rand(4,4)
4x4 Float64 Array:
 0.203775   0.375352   0.511788  0.484591
 0.66016    0.511109   0.21382   0.221793
 0.0725606  0.721304   0.422888  0.414681
 0.277821   0.0468625  0.133922  0.293754

julia> svd(a)
(
4x4 Float64 Array:
 -0.539078   0.276025   0.560245  -0.565094
 -0.54011   -0.754431  -0.32769   -0.178142
 -0.602381   0.532809  -0.446848   0.39189 
 -0.234122  -0.266005   0.615688   0.703816,

[1.46039, 0.525694, 0.337745, 0.0888284],
4x4 Float64 Array:
 -0.39384   -0.907445   0.107961  -0.0988802
 -0.632617   0.170939  -0.742152   0.140666 
 -0.463898   0.322713   0.326124  -0.757825 
 -0.479045   0.207797   0.575498   0.629395 )

julia> eig(a)
([1.39391+0.0im, -0.0822274+0.273878im, -0.0822274-0.273878im, 0.202075+0.0im],
4x4 Complex128 Array:
 0.524196+0.0im      0.0548-0.418641im  …  0.0452992+0.0im
 0.587802+0.0im   -0.343815+0.285943im     -0.296812+0.0im
 0.572813+0.0im         0.727812+0.0im     -0.532071+0.0im
 0.227142+0.0im  -0.298086+0.0565665im      0.791676+0.0im)

```
