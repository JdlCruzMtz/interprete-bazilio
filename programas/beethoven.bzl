Main |:
    <w> "Reproduciendo el 1er movimiento de la 9na Sinfonia..."
    
    ### Arpegio dramatico principal ###
    caida <- {A5 E5 C5 A4}
    respuesta <- {A4 C5 E5 A5}
    escala_descendente <- {A5 G5 F5 E5 D5 C5 B4 A4}
    
    ### Segundo arpegio ###
    caida_dos <- {E5 B4 G4 E4}
    respuesta_dos <- {E4 G4 B4 E5}
    escala_corta <- {E5 D5 C5 B4}
    
    ### Cierre del tema ###
    cierre <- {A4 A4 E5 A5 A5}

    ### Reproduccion en orden ###
    (:) caida
    (:) respuesta
    (:) escala_descendente
    
    (:) caida_dos
    (:) respuesta_dos
    (:) escala_corta
    
    (:) cierre
:|