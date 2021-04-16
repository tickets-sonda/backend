class Servicio {
	constructor(
		noServicio,
		fechaInicio,
		duracion,
		fechaFin,
		fechaAsignacion,
		fechaSolicitud,
		prioridad,
		estatus,
		sitio,
		responsableDelSitio,
		asunto,
		idTipoServicio,
		idMunicipio,
		idEmpresaCliente,
		noSerieProducto,
		noEmpleado,
		actividadesRealizadas,
		herramientas,
		noEmpleadoInvitado
	) {
		this.noServicio = noServicio;
		this.fechaInicio = fechaInicio;
		this.duracion = duracion;
		this.fechaFin = fechaFin;
		this.fechaAsignacion = fechaAsignacion;
		this.fechaSolicitud = fechaSolicitud;
		this.prioridad = prioridad;
		this.estatus = estatus;
		this.sitio = sitio;
		this.responsableDelSitio = responsableDelSitio;
		this.asunto = asunto;
		this.idTipoServicio = idTipoServicio;
		this.idMunicipio = idMunicipio;
		this.idEmpresaCliente = idEmpresaCliente;
		this.noSerieProducto = noSerieProducto;
		this.noEmpleado = noEmpleado;
		this.actividadesRealizadas = actividadesRealizadas;
		this.herramientas = herramientas;
		this.noEmpleadoInvitado = noEmpleadoInvitado;
	}
}

module.exports = Servicio;
