class Empleado {
	constructor(
		noEmpleado,
		nombre,
		paterno,
		materno,
		fechaIngreso,
		telefono,
		idMunicipio,
		direccion,
		sueldo,
		email,
		fechaNacimiento,
		metodoTransporte,
		sexo
	) {
		this.noEmpleado = noEmpleado;
		this.nombre = nombre;
		this.paterno = paterno;
		this.materno = materno;
		this.fechaIngreso = fechaIngreso;
		this.telefono = telefono;
		this.idMunicipio = idMunicipio;
		this.direccion = direccion;
		this.sueldo = sueldo;
		this.email = email;
		this.fechaNacimiento = fechaNacimiento;
		this.metodoTransporte = metodoTransporte;
		this.sexo = sexo;
	}
}

module.exports = Empleado;
