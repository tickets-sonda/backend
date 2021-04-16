var config = require('./dbconfig');
const sql = require('mssql');

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

async function getEmpleado(empleadoId) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, empleadoId)
			.query('SELECT * from Empleado where NoEmpleado = @input_parameter');
		return product.recordsets;
	} catch (error) {
		console.error(error);
	}
}

async function getEstado(estadoId) {
	try {
		let pool = await sql.connect(config);
		let product = await pool
			.request()
			.input('input_parameter', sql.Int, estadoId)
			.query('SELECT * from Estado where idEstado = @input_parameter');
		return product.recordsets;
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
	getEstado: getEstado,
};
