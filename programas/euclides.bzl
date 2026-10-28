Euclides a b |:
    while a /= b |:
        if a > b |:
            a <- a - b
        :| else |:
            b <- b - a
        :|
    :|
    <w> "Su MCD es" a
:|

Main |:
    <w> "Escribe dos numeros"
    <?> x
    <?> y
    Euclides x y
:|