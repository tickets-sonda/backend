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
	dboperations.getMunicipios().then((result) => {
		response.json(result[0]);
	});
});

router.route('/servicios').get((request, response) => {
	dboperations.getServicios().then((result) => {
		response.json(result[0]);
	});
});

router.route('/sucursales').get((request, response) => {
	dboperations.getSucursales().then((result) => {
		response.json(result[0]);
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

// POST
router.route('/estados').post((request, response) => {
	let estado = {...request.body};
	dboperations.setEstado(estado).then((result) => {
		response.status(201).json(result);
	});
});

router.route('/empleados').post((request, response) => {
	let empleado = {...request.body};
	dboperations.setEmpleado(empleado).then((result) => {
		response.status(201).json(result);
	});
});

router.route('/auth/login').post((request, response) => {
	let usuario = {...request.body};
	dboperations.login(usuario).then((result) => {
		response.status(201).json(result);
	});
});

var port = parseInt(process.env.PORT) || 8090;
app.listen(port);
console.log(`API is running at http://localhost:${port}/api/municipios`);
