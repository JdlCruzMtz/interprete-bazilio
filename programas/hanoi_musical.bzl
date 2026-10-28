Hanoi n ori dst aux |:
    if n > 0 |:
        Hanoi (n - 1) ori aux dst
        (:) (n + 22)
        Hanoi (n - 1) aux dst ori
    :|
:|

Main |:
    Hanoi 5 1 2 3
:|