package com.tecnosalle

import groovy.time.TimeCategory

class Asistencia {

    Date entrada
    Date salida

    static belongsTo = [empleado: Empleado]

    static constraints = {
        entrada validator: {
            it <= new Date()
        }
        salida nullable: true, validator: { val, obj ->
            if (val && val <= obj.entrada) return ['salidaAntes']
            if (val && val > new Date()) return ["salidaMayorAHoy"]
        }
    }

    def getHorasRealizadas() {
        if (!salida) {
            return TimeCategory.minus(entrada, entrada)
        }
        TimeCategory.minus(salida, entrada)
    }
}
