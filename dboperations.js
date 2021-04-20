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

async function getMunicipios() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM Municipio');
		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getServicios() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM Servicio');

		return products.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getSucursales() {
	try {
		let pool = await sql.connect(config);
		let products = await pool.request().query('SELECT * FROM Sucursal');

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
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, id)
			.query('SELECT * from Estado where idEstado = @input_parameter');
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
		let product = await pool
			.request()
			.input('nidMunicipio', sql.Int, id)
			.execute('sp_Municipio_Estado_ver');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getSucursal(id) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, id)
			.query('SELECT * from Sucursal where idSucursal = @input_parameter');
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
async function setEmpleado(empleado){
	console.log(empleado);
	try {
		let pool = await sql.connect(config);
		let insertProduct = await pool.request()
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

async function setEstado(estado){
	try {
		let pool = await sql.connect(config);
		let insertProduct = await pool.request()
			.input('NombreEstado', sql.VarChar, estado.Nombre)
			.execute('sp_Estado_Insertar');
		return insertProduct.recordsets;
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
};
