package com.tecnosalle

class Empleado {

    String codigo
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    String telefonoCelular
    String telefonoCasa
    String cargo

    Date dateCreated
    Departamento departamento
    Domicilio domicilio
    Genero genero
    Usuario usuario

    static constraints = {
        codigo unique: true, size: 4..19
        nombre shared: "personName"
        apellidoPaterno shared: "personName"
        apellidoMaterno shared: "personName"
        telefonoCasa nullable: true
        telefonoCelular nullable: true
        cargo size: 3..35

        domicilio nullable: true
        usuario nullable: true
    }

    static mapping = {
        genero enumType: "identity"
    }

    String getNombreCompleto() {
        "${nombre} ${apellidoPaterno} ${apellidoMaterno}"
    }

    @Override
    String toString() {
        "${nombre.split(" ")[0]} ${apellidoPaterno}"
    }
}
