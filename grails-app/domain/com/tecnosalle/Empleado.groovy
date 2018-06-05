package com.tecnosalle

class Empleado {

    String codigo
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    String telefonoCelular
    String telefonoCasa
    String cargo
    boolean isAdmin
    Date dateCreated
    Departamento departamento
    Domicilio domicilio
    Genero genero
    Usuario usuario

    static hasMany = [asistencias: Asistencia]

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

    String getNombreCorto() {
        "${nombre?.split(" ")[0]} ${apellidoPaterno}"
    }

    String getNombreCompleto() {
        "${nombre} ${apellidoPaterno} ${apellidoMaterno}"
    }

}
