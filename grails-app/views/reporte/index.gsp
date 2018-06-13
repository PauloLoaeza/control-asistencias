<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Reportes de asistencias</title>
    <asset:stylesheet src="select2.min.css" />
    <asset:stylesheet src="daterangepicker.css" />
    <%--<asset:stylesheet src="jquery.dataTables.css" />--%>
    <asset:stylesheet src="dataTables.bootstrap.min.css" />
    <asset:stylesheet src="buttons.dataTables.min.css" />
</head>

<body>

<content tag="nav">
    <g:render template="/menu/menu" model="${[current: 'reportes']}"></g:render>
</content>

<content tag="header">
    <h1>
        Reportes
        <small>Reportes de asistencias</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}" class="active"><i class="fa fa-home"></i>Inicio</a></li>
    </ol>
</content>


    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title"><span class="fa fa-file-text"></span> Generar reportes</h3>
        </div>
        <div class="box-body">
            <g:form action="index" method="post">
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="empleados">Empleados</label>
                            <g:select id="empleados" class="form-control select2" name="empleado" style="width: 100%;"
                                      from="${empleados}" value="${seleccionado?.id}" optionKey="id" optionValue="nombreCompleto" noSelection="['null': 'Todos']"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Rango de fechas</label>
                            <div class="input-group">
                                <button type="button" class="btn btn-primary form-control" id="btn-rango">
                                    <span>
                                        <i class="fa fa-calendar"></i> Rango de fechas
                                    </span>
                                    <i class="fa fa-caret-down"></i>
                                </button>
                            </div>
                        </div>

                        <input type="hidden" id="inicio" name="inicio" />
                        <input type="hidden" id="fin" name="fin" />
                    </div>
                    <div class="col-md-3">
                        <br>
                        <button id="btn" class="btn btn-success form-control" type="submit"><i class="fa fa-search"></i> Filtrar</button>
                    </div>
                </div>
            </g:form>
            <hr>

            <div class="table-responsive">
                <table id="asistencias" class="table table-bordered table-striped display">
                    <thead>
                        <tr>
                            <th>Empleado</th>
                            <th>Fecha</th>
                            <th>Entrada</th>
                            <th>Salida</th>
                            <th>Horas realizadas</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${asistencias}">
                        <tr>
                            <td><g:link controller="asistencia" action="index" id="${it.empleado.id}">${it.empleado.nombreCompleto}</td></g:link></td>
                            <td><g:formatDate date="${it.entrada}" format="dd/MM/yyyy"/> </td>
                            <td><g:formatDate date="${it.entrada}" format="hh:mm:ss a"/> </td>
                            <td><g:formatDate date="${it.salida}" format="hh:mm:ss a"/> </td>

                            <g:set var="realizadas" value="${it.horasRealizadas}" />
                            <td>${realizadas.hours} ${realizadas.minutes ? ":" + realizadas.minutes : ""}${realizadas.seconds ? ":" + realizadas.seconds : ""} hrs.</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<content tag="scripts">
    <asset:javascript src="select2.full.min.js" />

    <asset:javascript src="moment-with-locales.min.js" />
    <asset:javascript src="daterangepicker.js" />

    <asset:javascript src="jquery.dataTables.min.js" />
    <asset:javascript src="dataTables.bootstrap.min.js" />
    <asset:javascript src="dataTables.buttons.min.js" />
    <asset:javascript src="buttons.flash.min.js" />
    <asset:javascript src="pdfmake.min.js" />
    <asset:javascript src="vfs_fonts.js" />
    <asset:javascript src="buttons.html5.min.js" />
    <asset:javascript src="buttons.print.min.js" />


    <script type="text/javascript">
        $(function () {
            $("#empleados").select2();

            moment.locale('es');
            var inicio = moment('${inicio}', 'DD/MM/YYYY');
            var fin = moment('${fin}', 'DD/MM/YYYY');

            function fechaSeleccionada(inicio, fin) {
                $('#btn-rango span').html(inicio.format('MMMM D, YYYY') + ' - ' + fin.format('MMMM D, YYYY'));
                $('#inicio').val(inicio.format('DD/MM/YYYY 00:00:00'));
                $('#fin').val(fin.format('DD/MM/YYYY 23:59:59'));
            }

            $("#btn-rango").daterangepicker({
                ranges: {
                    'Hoy': [moment(), moment()],
                    'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Últimos 7 días': [moment().subtract(6, 'days'), moment()],
                    'Últimos 15 días': [moment().subtract(14, 'days'), moment()],
                    'Mes actual': [moment().startOf('month'), moment().endOf('month')],
                    'Mes pasado'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                locale: {
                    applyLabel: 'Aplicar',
                    cancelLabel: 'Cancelar',
                    customRangeLabel: 'Personalizado'
                },
                startDate: inicio,
                endDate  : fin,
                maxDate: moment()
            }, fechaSeleccionada);

            fechaSeleccionada(inicio, fin);

            $('#asistencias').dataTable({
                dom: 'Bfrtip',
                //"lengthMenu": [[10, 30, -1], [10, 30, "Todos"]],
                "lengthChange": false,
                "paging": false,
                "searching": false,
                "autoWidth": false,
                "order": [[1, "desc"],[2, "desc"]],
                "language": {
                    "emptyTable": "Sin registros",
                    "info": "Asistencias: _TOTAL_",
                    "infoEmpty": "Sin registros por mostrar",
                    "infoFiltered": "(_MAX_ registros filtrados)",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar empleado:",
                    "zeroRecords": "No se encontraron resultados",
                    "paginate": {
                        "first": "Inicio",
                        "last": "Fin",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                },
                buttons: [
                    {
                        extend: 'pdf',
                        text: '<span class="fa fa-file-pdf-o"> Guardar como PDF</span>',
                        exportOptions: {
                            modifier: {
                                page: 'current'
                            }
                        }
                    },
                    {
                        extend: 'print',
                        text: '<span class="fa fa-print"> Imprimir<span>',
                        autoPrint: true
                    }
                ]
            });
        });
    </script>
</content>
</body>
</html>
