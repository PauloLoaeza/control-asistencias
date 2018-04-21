package com.tecnosalle

import groovy.transform.CompileStatic

@CompileStatic
enum Genero {

    MASCULINO (0, "Masculino"),
    FEMENINO  (1, "Femenino")

    final int id
    final String sexo

    private Genero(int id, String sexo) {
        this.id = id
        this.sexo = sexo
    }

    @Override
    String toString() {
        return sexo
    }
}