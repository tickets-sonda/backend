var config = require('./dbconfig');
const sql = require('mssql');

console.log(config);

// GET Generales
async function getEmpleados() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM Empleado');

		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getEmpresasCliente() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM EmpresaCliente');

		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getEquiposRefacciones() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM EquipoRefacciones');

		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getEstados() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM Estado');
		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getMunicipios(municipios) {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().input('nidMunicipio', sql.Int, municipios.idMunicipio).execute('sp_Municipio_Estado_ver');
		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getServicios(servicio) {
	console.log(servicio);
	try {
		let pool = await sql.connect(config);
		let products = await pool
			.request()
			.input('psidUser', sql.VarChar, servicio.idUser)
			.input('psEstatus', sql.VarChar, servicio.Estatus)
			.input('psVariable', sql.VarChar, servicio.Variable)
			.execute('sp_TablasVistaDeServicios');
		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getSucursales(sucursales) {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().input('nidSucursal', sql.Int, sucursales.id).execute('sp_Sucursal_ver');

		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getTiposMovProducto() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM TipoMovProducto');

		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getTiposServicio() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM TipoServicio');

		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getTiposUsuarios() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM TipoUsuario');

		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getUsuarios() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM Usuario');

		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

// GET Especificos
async function getEmpleado(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, id)
			.query('SELECT * from Empleado where NoEmpleado = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getEmpresaCliente(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, id)
			.query('SELECT * from EmpresaCliente where idEmpresaCliente = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getEquipoRefaccion(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.VarChar, id)
			.query('SELECT * from EquipoRefacciones where NoSerieProducto = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getEstado(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool.request().input('input_parameter', sql.Int, id).query('SELECT * from Estado where idEstado = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getServicio(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, id)
			.query('SELECT * from Servicio where NoServicio = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getMunicipio(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool.request().input('nidMunicipio', sql.Int, id).execute('sp_Municipio_Estado_ver');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getSucursal(id) {
	console.log('getsucursal id', id);
	try {
		let pool = await sql.connect(config);
		let product = await pool.request().input('nidSucursal', sql.Int, id).execute('sp_Sucursal_ver');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getTipoMovProducto(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, id)
			.query('SELECT * from TipoMovProducto where idTipoMovProducto = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getTipoServicio(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, id)
			.query('SELECT * from TipoServicio where idTipoServicio = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getTipoUsuario(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, id)
			.query('SELECT * from TipoUsuario where idTipoUsuario = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getUsuario(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.VarChar, id)
			.query('SELECT * from Usuario where idUser = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

// POST Especificos
async function setEmpleado(empleado) {
	console.log(empleado);
	try {
		let pool = await sql.connect(config);
		let insertProduct = await pool
			.request()
			.input('psNombre', sql.VarChar, empleado.Nombre)
			.input('psPaterno', sql.VarChar, empleado.Paterno)
			.input('psMaterno', sql.VarChar, empleado.Materno)
			.input('pdFechaIngreso', sql.DateTime, empleado.FechaIngreso)
			.input('psTelefono', sql.VarChar, empleado.Telefono)
			.input('pnIdMunicipio', sql.Int, empleado.idMunicipio)
			.input('psDireccion', sql.VarChar, empleado.Direccion)
			.input('pmSueldo', sql.Money, empleado.Sueldo)
			.input('psEmail', sql.VarChar, empleado.Email)
			.input('pdFechaNacimiento', sql.DateTime, empleado.FechaNacimiento)
			.input('psMetodoTransporte', sql.VarChar, empleado.MetodoTransporte)
			.input('psSexo', sql.VarChar, empleado.Sexo)
			.execute('sp_Empleado_Insertar');
		return insertProduct.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function setEstado(estado) {
	try {
		let pool = await sql.connect(config);
		let insertProduct = await pool.request().input('psNombreEstado', sql.VarChar, estado.Nombre).execute('sp_Estado_Insertar');
		return insertProduct.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function setTipoServicio(tipoServicio) {
	console.log(tipoServicio);
	try {
		let pool = await sql.connect(config);
		let insertProduct = await pool
			.request()
			.input('psNombreTipoServicio', sql.VarChar, tipoServicio.Nombre)
			.execute('sp_TipoServicio_Insert');
		return insertProduct.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function setMunicipio(municipio) {
	console.log(municipio);
	try {
		let pool = await sql.connect(config);
		let insertProduct = await pool
			.request()
			.input('NombreMunicipio', sql.VarChar, municipio.Nombre)
			.input('idEstado', sql.Int, municipio.idEstado)
			.execute('sp_Municipio_Insert');
		return insertProduct.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function login(usuario) {
	try {
		let pool = await sql.connect(config);
		let insertProduct = await pool
			.request()
			.input('psidUser', sql.VarChar, usuario.idUser)
			.input('psClaveUsuario', sql.VarChar, usuario.ClaveUsuario)
			.input('pnidTipoUsuario', sql.Int, parseInt(usuario.idTipoUsuario))
			.execute('sp_Usuario_Login');
		return insertProduct.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function setServicio(servicio) {
	console.log(servicio);
	try {
		let pool = await sql.connect(config);
		let insertProduct = await pool
			.request()
			.input('pnIdEmpresaCliente', sql.Int, servicio.idEmpresaCliente)
			.input('psIdUser', sql.VarChar, servicio.idUser)
			.input('pdFechaSolicitud', sql.DateTime, servicio.FechaSolicitud)
			.input('psAsunto', sql.VarChar, servicio.Asunto)
			.input('psResponsableSitio', sql.VarChar, servicio.ResponsableSitio)
			.input('pidSucursal', sql.Int, servicio.Sucursal)
			.input('psEmail', sql.VarChar, servicio.Email)
			.execute('sp_EnviarSolicitud_ServicioInsert_1');
		return insertProduct.recordsets;
	} catch (error) {
		console.error(error);
	}
}

// DELETE

async function deleteEmpleado(empleado) {
	try {
		let pool = await sql.connect(config);
		let deleteProduct = await pool.request().input('pnNoEmpleado', sql.Int, empleado.id).execute('sp_Empleado_Delete');
		return deleteProduct.recordsets;
	} catch (error) {
		console.error(error);
	}
}

module.exports = {
	getEmpleados: getEmpleados,
	getEmpresasCliente: getEmpresasCliente,
	getEquiposRefacciones: getEquiposRefacciones,
	getEstados: getEstados,
	getMunicipios: getMunicipios,
	getServicios: getServicios,
	getSucursales: getSucursales,
	getTiposMovProducto: getTiposMovProducto,
	getTiposServicio: getTiposServicio,
	getTiposUsuarios: getTiposUsuarios,
	getUsuarios: getUsuarios,
	getEmpleado: getEmpleado,
	getEmpresaCliente: getEmpresaCliente,
	getEquipoRefaccion: getEquipoRefaccion,
	getEstado: getEstado,
	getMunicipio: getMunicipio,
	getServicio: getServicio,
	getSucursal: getSucursal,
	getTipoMovProducto: getTipoMovProducto,
	getTipoServicio: getTipoServicio,
	getTipoUsuario: getTipoUsuario,
	getUsuario: getUsuario,
	setEmpleado: setEmpleado,
	setEstado: setEstado,
	login: login,
	setTipoServicio: setTipoServicio,
	setMunicipio: setMunicipio,
	deleteEmpleado: deleteEmpleado,
	setServicio: setServicio,
};
