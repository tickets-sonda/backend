require('dotenv').config();
const dboperations = require('./dboperations');
var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');
var app = express();
var router = express.Router();

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use(cors());
app.use('/api', router);

router.use((request, response, next) => {
	console.log(`[${request.method}] ${request.originalUrl}`);
	next();
});

// Consultas generales
router.route('/empleados').get((request, response) => {
	dboperations.getEmpleados().then((result) => {
		response.json(result[0]);
	});
});

router.route('/empresas-cliente').get((request, response) => {
	dboperations.getEmpresasCliente().then((result) => {
		response.json(result[0]);
	});
});

router.route('/equipos-refacciones').get((request, response) => {
	dboperations.getEquiposRefacciones().then((result) => {
		response.json(result[0]);
	});
});

router.route('/estados').get((request, response) => {
	dboperations.getEstados().then((result) => {
		response.json(result[0]);
	});
});

router.route('/municipios').get((request, response) => {
	let municipios = {
		idMunicipio: -1,
	};
	dboperations.getMunicipios(municipios).then((result) => {
		console.log(result);
		response.json(result[0]);
	});
});

router.route('/servicios').get((request, response) => {
	let servicios = {...request.body};
	dboperations.getServicios(servicios).then((result) => {
		let body;
		console.log(result);
		// if (result[0][0]['']) {
		// 	body = {
		// 		Message: result[0][0][''],
		// 	};
		// 	response.status(201).json(body);
		// } else {
		// 	response.status(201).json(result[0][0]);
		// }
	});
});

router.route('/sucursales').post((request, response) => {
	let sucursales = {
		...request.body,
	};
	dboperations.getSucursales(sucursales).then((result) => {
		console.log(result);
		let body;
		if (result[0][0]['']) {
			body = {
				Message: result[0][0][''],
			};
			response.status(201).json(body);
		} else {
			response.status(201).json(result[0]);
		}
	});
});

router.route('/tipos-movimiento-producto').get((request, response) => {
	dboperations.getTiposMovProducto().then((result) => {
		response.json(result[0]);
	});
});

router.route('/tipos-servicio').get((request, response) => {
	dboperations.getTiposServicio().then((result) => {
		response.json(result[0]);
	});
});

router.route('/tipos-usuario').get((request, response) => {
	dboperations.getTiposUsuarios().then((result) => {
		response.json(result[0]);
	});
});

router.route('/usuarios').get((request, response) => {
	dboperations.getUsuarios().then((result) => {
		response.json(result[0]);
	});
});

// Consultas especificas
router.route('/empleados/:id').get((request, response) => {
	dboperations.getEmpleado(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/empresas-cliente/:id').get((request, response) => {
	dboperations.getEmpresaCliente(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/equipos-refacciones/:id').get((request, response) => {
	dboperations.getEquipoRefaccion(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/estados/:id').get((request, response) => {
	dboperations.getEstado(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/municipios/:id').get((request, response) => {
	dboperations.getMunicipio(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/servicios/:id').get((request, response) => {
	dboperations.getServicio(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/sucursales/:id').get((request, response) => {
	dboperations.getSucursal(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/tipos-movimiento-producto/:id').get((request, response) => {
	dboperations.getTipoMovProducto(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/tipos-servicio/:id').get((request, response) => {
	dboperations.getTipoServicio(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/tipos-usuario/:id').get((request, response) => {
	dboperations.getTipoUsuario(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/usuarios/:id').get((request, response) => {
	dboperations.getUsuario(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

router.route('/detalle/:id').get((request, response) => {
	console.log(request.params.id);
	dboperations.getDetalle(request.params.id).then((result) => {
		response.json(result[0][0]);
	});
});

// POST
router.route('/registro/estado').post((request, response) => {
	let estado = {...request.body};
	dboperations.setEstado(estado).then((result) => {
		let body = {
			Message: result[0][0][''],
		};
		response.status(201).json(body);
	});
});

router.route('/registro/empleado').post((request, response) => {
	let empleado = {...request.body};
	dboperations.setEmpleado(empleado).then((result) => {
		let body;
		if (result[0][0]['']) {
			body = {
				Message: result[0][0][''],
			};
			response.status(201).json(body);
		} else {
			response.status(201).json(result[0][0]);
		}
	});
});

router.route('/registro/tipo-servicio').post((request, response) => {
	let tipoServicio = {...request.body};
	dboperations.setTipoServicio(tipoServicio).then((result) => {
		let body;
		if (result[0][0]['']) {
			body = {
				Message: result[0][0][''],
			};
			response.status(201).json(body);
		} else {
			response.status(201).json(result[0][0]);
		}
	});
});

router.route('/registro/municipio').post((request, response) => {
	let municipio = {...request.body};
	dboperations.setMunicipio(municipio).then((result) => {
		let body;
		if (result[0][0]['']) {
			body = {
				Message: result[0][0][''],
			};
			response.status(201).json(body);
		} else {
			response.status(201).json(result[0][0]);
		}
	});
});

router.route('/auth/login').post((request, response) => {
	let usuario = {...request.body};
	dboperations.login(usuario).then((result) => {
		let body;
		if (result[0][0]['']) {
			body = {
				Message: result[0][0][''],
			};
			response.status(201).json(body);
		} else {
			response.status(201).json(result[0][0]);
		}
	});
});

router.route('/registro/servicio').post((request, response) => {
	let servicio = {...request.body};
	console.log(servicio);
	dboperations.setServicio(servicio).then((result) => {
		let body;
		if (result[0][0]['']) {
			body = {
				Message: result[0][0][''],
			};
			response.status(201).json(body);
		} else {
			response.status(201).json(result[0][0]);
		}
	});
});

router.route('/tablas').post((request, response) => {
	console.log(request.body);
	let tablas = {...request.body};
	console.log(tablas);
	dboperations.getTablas(tablas).then((result) => {
		console.log(result);
		let body;
		if (result[0][0]['']) {
			body = {
				Message: result[0][0][''],
			};
			response.status(201).json(body);
		} else {
			response.status(201).json(result[0]);
		}
	});
});

// DELETE
router.route('/eliminar/empleados/:id').delete((request, response) => {
	let empleado = {...request.params};
	dboperations.deleteEmpleado(empleado).then((result) => {
		let body = {
			Message: result[0][0][''],
		};
		response.status(201).json(body);
	});
});

var port = parseInt(process.env.PORT) || 8090;
app.listen(port);
console.log(`API is running at http://localhost:${port}/api/municipios`);
