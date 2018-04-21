package com.tecnosalle

class Departamento {

    String codigo
    String nombre
    String descripcion

    static constraints = {
        codigo nullable: false, unique: true, size: 3..12
        nombre nullable: false, blank: false, size: 3..20
        descripcion nullable: true, size: 0..45
    }

    @Override
    String toString() {
        "(${codigo}) " + nombre
    }
}
