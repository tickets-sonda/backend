var Empleado = require('./model/empleado');
var EmpresaCliente = require('./model/empresaCliente');
var EquipoRefacciones = require('./model/equipoRefacciones');
var Estado = require('./model/estado');
var Municipio = require('./model/municipio');
var Servicio = require('./model/servicio');
var Sucursal = require('./model/sucursal');
var TipoMovProducto = require('./model/tipoMovProducto');
var TipoServicio = require('./model/tipoServicio');
var TipoUsuario = require('./model/tipoUsuario');
var Usuario = require('./model/usuario');

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
	console.log('middleware');
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

router.route('/estados/:id').get((request, response) => {
	dboperations.getEstado(request.params.id).then((result) => {
		response.json(result[0]);
	});
});

var port = process.env.PORT || 8090;
app.listen(port);
console.log('API is running at', port);
