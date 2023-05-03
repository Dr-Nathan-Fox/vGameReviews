
<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/nfox29/steamReviews/branch/main/graph/badge.svg)](https://app.codecov.io/gh/nfox29/steamReviews?branch=main)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

# steamReviews <a href="https://github.com/nfox29/steamReviews"><img src="man/figures/README-logo.png" align="right" height="132" /></a>

The goal of this R package is to provide an accessible method for
returning reviews from the Steam API into the R environment. The package
can also be used to find information about the games, see the

## Return all reviews for a game

The main function of the package is `allReviews`

The function is used to return every review of a game on the Steam
store.

``` r
#library the package
library(steamReviews)

#Get reviews for Planet Zoo: Conservation Pack
reviews <- allReviews(game_id = 2013290)

#inspect reviews
head(reviews$review)
#> [1] "Another strong pack from Frontier.\n\nThere is some really nice items to play around in this pack especially the back ground staff areas. And the new soloar panel lights are a must!\n\nNice selection of animals especially the siamang. What an amazing primate to have.\n\nPlease keep up the good work Frontier"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
#> [2] "very nice pack  with some unique rare creatures!"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
#> [3] "More Animals (very sweet animals)\nMore Plants\nA whole bunch of new scenery\n\nWorth it can recommend"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
#> [4] "MONKE"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
#> [5] "Overall, this pack is fine. It's a continuation of what we have been getting since 2019 now, the picks are mostly highly requested, the Przewalski's horse and gibbon have been some of the most highly requested animals since launch, however this far in I am questioning if this DLC is worth it. I think if you like Planet Zoo this is a no brainer to buy, the pieces are great and the animals are as high quality as any other DLC (minus a few issues here and there)\n\nHowever, with more than likely support for Planet Zoo nearing its end and no aviaries or marine DLC in sight, it seems weird to release a pack like this. I think people are happy with what they got, and the pack is good, but if support were to stop here or in two more packs, I question if in retrospect this pack will have been worth the time. Both of these features I have mentioned, aviaries and marine animals, are in Jurassic World Evolution 2, and even Planet Coaster has pigeons that are able to fly around. I do hope we get these features, but as it stands now this is the most \"eh\" pack to me since Arctic, and Arctic had the benefit of being the 1st DLC with room to learn, which Frontier has."
#> [6] "Love it good game pack"
```

## Find a games ID

Most functions of the package require you to know the specific Steam
store app id.

This can be found using the `gameID` function.

``` r
#library the package
library(steamReviews)

#Find game IDs for games containing the word "Halo"
ids <- gameID("Halo")

#inspect game IDs
head(ids)
#>                                           
#> 1 2024010          Chasing Halo:Iron Storm
#> 2 1064220                      Halo: Reach
#> 3 1064221 Halo: Combat Evolved Anniversary
#> 4 1064270              Halo 2: Anniversary
#> 5 1064271                           Halo 3
#> 6 1064272                     Halo 3: ODST
```

## Issues and bugs

This package requires an internet connection as well as a connection to
the Steam API, which may not be constantly available.

If you discover a bug not associated with connection to the API that is
not already a [reported
issue](https://github.com/nfox29/steamReviews/issues), please [open a
new issue](https://github.com/nfox29/steamReviews/issues/new) providing
a reproducible example.
