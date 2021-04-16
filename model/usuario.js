class Usuario {
	constructor(id, claveUsuario, idTipoUsuario, noEmpleado, idEmpresaCliente) {
		this.id = id;
		this.claveUsuario = claveUsuario;
		this.idTipoUsuario = idTipoUsuario;
		this.noEmpleado = noEmpleado;
		this.idEmpresaCliente = idEmpresaCliente;
	}
}

module.exports = Usuario;
