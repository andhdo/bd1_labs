# limite central
f_limcentral <- function( r ) {
  hist(rnorm(r))  
}

f_limcentral(1:5)
#> f_limcentral(1:50)
#> f_limcentral(1:500)
#> f_limcentral(1:5000)
#> f_limcentral(1:50000)
#> f_limcentral(1:500000)

