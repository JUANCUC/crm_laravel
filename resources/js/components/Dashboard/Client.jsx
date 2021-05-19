import axios from 'axios';
import React, { useState, useEffect } from 'react'
import DataTable from 'react-data-table-component'
import {Modal, Button, Form, Row, Col, Alert, Spinner} from 'react-bootstrap'

import {
	Link,
	useRouteMatch
} from "react-router-dom";

import { initAxios } from '../helpers/auth-helper'

initAxios()

export const Client = () => {
	let { url } = useRouteMatch()
	const [clients, setClients] = useState([])
	const [departments, setDepartments] = useState([])
	const [townships, setTownships] = useState([])
	
	const [data, setData] = useState([])
	const [showDelete, setShowDelete] = useState(false)
	const [showRegister,setShowRegister] = useState(false)
	const [searchValue, setSearchValue] = useState('')
	const [id, setId] = useState(null)
	const [success, setSuccess] = useState(false)
	const [variant, setVariant] = useState('')
	const [message, setMessage] = useState('')
	const [flag, setFlag] = useState(false)
	const [spinner, setSpinner] = useState(true)

	const [dpi, setDpi] = useState(null)
	const [name, setName] = useState(null)
	const [last_name, setLastName] = useState(null)
	const [nit, setNit] = useState(null)
	const [age, setAge] = useState(null)
	const [department, setDepartment] = useState(null)
	const [township, setTownship] = useState(null)
	const [address, setAddress] = useState(null)
	const [errors, setErros] = useState({})

	const columns = [
		{
			name: 'DPI',
			selector: 'dpi',
			sortable: true
		},
		{
			name: 'Nombre',
			selector: 'name',
			sortable: true
		},
		{
			name: 'Apellido',
			selector: 'last_name',
			sortable: true
		},
		// {
		// 	name: 'Edad',
		// 	selector: 'age',
		// 	sortable: true
		// },
		{
			name: 'NIT',
			selector: 'nit',
			sortable: true
		},
		{
			name: 'Direccion',
			selector: 'address',
			sortable: true
		},
		{
			name: 'Departamento',
			selector: 'department',
			sortable: true
		},
		{
			name: 'Municipio',
			selector: 'township',
			sortable: true
		},
		{
			name: 'Acciones',
			cell: row => (
				<div className="btn-group" >
					<button className="btn btn-primary btn-sm " value={row.id} onClick={handleEdit} ><i className="fas fa-edit"></i></button>
					<button className="btn btn-danger btn-sm" value={row.id} onClick={handleDelete} ><i className="fas fa-trash"></i></button>
					<Link className="btn btn-info btn-sm" to={`${url}/reportes/${row.id}`}><i className="fas fa-chart-line"></i></Link>
				</div>
			),
			
		}
	]

	const handleDelete = e => {
		let value = e.target.value
		
		if(value) {
			console.log(e.target.value)
			setId(value)	
			//console.log(value)
		}else {
			//console.log(e.target.parentElement.value)
			value = e.target.parentElement.value
			if(value) {
				setId(value)	
			}
		}
		console.log(value)
		setId(value)
		setShowDelete(!showDelete)
	}

	const handleEdit = e => {
		let value = e.target.value
		
		//console.log(value)
		if(value) {
			console.log(e.target.value)
			setId(value)	
			//console.log(value)
		}else {
			console.log(e.target.parentElement.value)
			value = e.target.parentElement.value
			if(value) {
				setId(value)	
			}
		}

		setDpi(null)
		setName(null)
		setLastName(null)
		setNit(null)
		setAge(null)
		setDepartment(null)
		setTownship(null)
		setAddress(null)
		
		if(value) {
			getClient(value)
		}else {
			setShowRegister(!showRegister)
		}
		
	}

	const filterData = value => {

		let filter = clients.filter(item => {
			if(item.dpi.toString().includes(value) ||
			item.name.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,"").includes(value) ||
			item.last_name.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,"").includes(value) ||
			item.address.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,"").includes(value) ||
			item.department.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,"").includes(value) ||
			item.township.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,"").includes(value) ||
			item.nit.toString().includes(value) ||
			item.age.toString().includes(value) 
			){
				return item;
			}
		})

		setData(filter)
	}

	const handleSearch = e => {
		e.persist()
		let value = e.target.value
		setSearchValue(value)
		//console.log(searchValue, value)
		filterData(value)
	}

	const getClient = async id => {
		try {
			const response = await axios.get('/clients/'+id)
			const data = response.data
			console.log(data)
			setDpi(data.dpi)
			setName(data.name)
			setLastName(data.last_name)
			setNit(data.nit)
			setAge(data.age)
			setDepartment(data.id_department)
			setTownship(data.id_township)
			setAddress(data.address)
			setShowRegister(!showRegister)

			getTownships(data.id_department)

		} catch (error) {
			console.log(error.message)
		}
	}

	const getClients = async () => {
		try {
			const response = await axios.get('/clients')
			const data = response.data
			setData(data)
			setClients(data)
			setSpinner(false)
		} catch (error) {
			console.log(error.message)
		}
	}

	const getDepartments = async () => {
		try {
			const response = await axios.get('/departments')
			const data = response.data
			setDepartments(data)
		} catch (error) {
			console.log(error.message)
		}
	}

	const changeDepartment = async ({target}) => {
		const { name, value } = target
		console.log(target)
		console.log('change')
		let id = target.value
		if(name === 'department') setDepartment(value)
		
		getTownships(id)
		//setValues(obj)
		
		
	}

	const getTownships = async id => {
		try {
			const response = await axios.get(`/townships?department=${id}`)
			const data = response.data
			setTownships(data)
			console.log(data)
		} catch (error) {
			console.log(error.message)
		}
	}

	const createClient = async values => {
		try {
			const response = await axios({
				method: 'POST',
				url: '/clients',
				headers: {
					'Content-Type': 'application/json',
				},
				data: JSON.stringify(values)
			})

			const data = response.data
			setVariant('success')
			setMessage(data.message)
			setSuccess(true)
			console.log(data)
			setShowRegister(!showRegister)
			setFlag(!flag)
		} catch (error) {
			console.log(error.message)
			setSuccess(true)
			setVariant('danger')
			setMessage(error.message)
			setShowRegister(!showRegister)
			setFlag(!flag)
		}
	}

	const updateClient = async values => {
		try {
			const response = await axios({
				method: 'PUT',
				url: '/clients/'+id,
				headers: {
					'Content-Type': 'application/json',
				},
				data: JSON.stringify(values)
			})

			const data = response.data
			setVariant('success')
			setMessage(data.message)
			setSuccess(true)
			console.log(data)
			setShowRegister(!showRegister)
			setFlag(!flag)
		} catch (error) {
			console.log(error.message)
			setSuccess(true)
			setVariant('danger')
			setMessage(error.message)
			setShowRegister(!showRegister)
			setFlag(!flag)
		}
	}


	const deleteClient = async (id) => {
		try {
			const response = await axios({
				method: 'DELETE',
				url: '/clients/'+id,
				headers: {
					'Content-Type': 'application/json',
				},
			})

			const data = response.data
			setVariant('success')
			setMessage(data.message)
			setSuccess(true)
			console.log(data)
			setShowRegister(!showRegister)
			setFlag(!flag)
		} catch (error) {
			console.log(error.message)
			setSuccess(true)
			setVariant('danger')
			setMessage(error.message)
			setShowRegister(!showRegister)
			setFlag(!flag)
		}
	}

	const handleChange = ({target}) => {
		const { name, value } = target
		
		if(name === 'dpi') setDpi(value)
		if(name === 'name') setName(value)
		if(name === 'last_name') setLastName(value)
		if(name === 'nit') setNit(value)
		if(name === 'age') setAge(value)
		if(name === 'department') setDepartment(value)
		if(name === 'township') setTownship(value)
		if(name === 'address') setAddress(value)

	}

	const handleDeleteClient = () => {
		deleteClient(id)
	}

	const validate = values => {
		const errors = {}

		if(!values.dpi) errors.dpi = 'true' 
		if(!values.name) errors.name = true
		if(!values.last_name) errors.lastName = true
		if(!values.nit) errors.nit = true
		if(!values.age) errors.age = true
		if(!values.department) errors.department = true
		if(!values.township) errors.township = true
		if(!values.address) errors.address = true

		return errors
	}

	const handleSubmit = e => {
		e.preventDefault()
		
		const sinErrors = {dpi,name,last_name,nit,age,department,township,address}
		
		const result = validate(sinErrors)
		
		setErros(result)

		if(!Object.keys(result).length) {
			if(id) {
				updateClient(sinErrors)
			}else {
				createClient(sinErrors)
			}
		}

	}

	const handleClose = () => {
		setShowRegister(!showRegister)
		setId(null)
	}

	useEffect(() => {
		setSpinner(true)
		getClients()
		getDepartments()
		//getTownships()
	},[flag])

	return (
		<>
			{success && 
				<Alert variant={variant} onClose={() => setSuccess(false)} dismissible>
					{message}
				</Alert>
			}
			
			{spinner ? (
				<div style={{position: 'absolute', right: '50%', top: 'calc(50% - 40px)'}}>
					<div className="sk-folding-cube">
						<div className="sk-cube1 sk-cube"></div>
						<div className="sk-cube2 sk-cube"></div>
						<div className="sk-cube4 sk-cube"></div>
						<div className="sk-cube3 sk-cube"></div>
					</div>
				</div>
			) : (
				<div >
				<h1>Clientes</h1>
					<div className="card border-0 rounded-3 shadow p-3 my-3">
						<div className="row justify-content-between align-items-center mb-3">
							<div className="col-md-3">
								<button className="btn btn-primary" onClick={handleEdit}>Agregar nuevo cliente</button>
							</div>
							<div className="col-md-3 align-content-center">
								<div className="search">
									<div className="input-group ">
										<input type="text" className="form-control form-control-sm" placeholder="Buscar..." value={searchValue} onChange={handleSearch}/>
										<button className="btn btn-primary btn-sm " >
											<i className="fas fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						
						<div className="table-responsive">
							<div className="table">
								<DataTable
									keyField='id'
									className="p-0"
									title="Listado de clientes"
									columns={columns}
									data={data}      
									pagination 	
									paginationComponentOptions ={{
										rowsPerPageText: 'Filas por pagina',
										rangeSeparatorText: 'de',
										selectAllRowsItem: true,
										selectAllRowsItemText: 'Todos'
									}}
									responsive={true}
									noDataComponent={<span>No se encontró ningún elemento</span>}
								/>
							</div>
						</div>
					</div>
				</div>
			)}

			
			
			<Modal 
				show={showRegister} 
				onHide={handleClose} 
				size="lg"
				className="border-none"
			>
				<Form 
					onSubmit={handleSubmit}
				>
					<Modal.Header closeButton>
						<Modal.Title>Registar nuevo cliente</Modal.Title>
					</Modal.Header>
						<Modal.Body
							className="p-4"
						>
							<Row>
								<Col
									md={6}
								>
									<Form.Group controlId="dpi">
										<Form.Label>Numero de DPI</Form.Label>
										<Form.Control 
											name="dpi"
											type="text" 
											placeholder="DPI" 
											value={id && dpi}
											onChange={handleChange}
										/>
										{errors.dpi && 
											<Form.Control.Feedback type="invalid" className="d-flex">
												Campo requirdo
											</Form.Control.Feedback>
										}
									</Form.Group>
								</Col>
							</Row>
							<Row>
								<Col
									md={6}
								>
									<Form.Group controlId="name">
										<Form.Label>Nombre</Form.Label>
										<Form.Control 
											name="name"
											type="text" 
											placeholder="Primer nombre" 
											value={id && name }
											onChange={handleChange}
										/>
										{errors.name && 
											<Form.Control.Feedback type="invalid"  className="d-flex">
												Campo requirdo
											</Form.Control.Feedback>
										}
									</Form.Group>
								</Col>
								<Col
									md={6}
								>
									<Form.Group controlId="last_name">
										<Form.Label>Apellido</Form.Label>
										<Form.Control 
											name="last_name"
											type="text" 
											placeholder="Primer apellido" 
											value={id && last_name }
											onChange={handleChange}
										/>
										{errors.lastName && 
											<Form.Control.Feedback type="invalid"  className="d-flex">
												Campo requirdo
											</Form.Control.Feedback>
										}
									</Form.Group>
								</Col>
								<Col
									md={6}
								>
									<Form.Group controlId="nit">
										<Form.Label>NIT</Form.Label>
										<Form.Control 
											name="nit"
											type="text" 
											placeholder="NIT" 
											value={id && nit }
											onChange={handleChange}
										/>
										{errors.nit && 
											<Form.Control.Feedback type="invalid"  className="d-flex">
												Campo requirdo
											</Form.Control.Feedback>
										}
									</Form.Group>
								</Col>
								<Col
									xs={3}
								>
									<Form.Group controlId="age">
										<Form.Label>Edad</Form.Label>
										<Form.Control 
											name="age"
											type="number" 
											placeholder="Edad" 
											min={1} 
											value={id && age }
											onChange={handleChange}
										/>
										{errors.age && 
											<Form.Control.Feedback type="invalid"  className="d-flex">
												Campo requirdo
											</Form.Control.Feedback>
										}
									</Form.Group>
								</Col>
								<Col
									md={6}
								>
									<Form.Group controlId="department">
										<Form.Label>Departamento</Form.Label>
										<Form.Control
											name="department" 
											as="select" 
											placeholder="Guatemala" 
											
											onChange={changeDepartment}
											value={id && department }
										>
											<option value="">Seleccione un departamento</option>
											{departments.map((el,index) => (
												<option key={index} value={el.id} >{el.name}</option>
											))}
										</Form.Control>
										{errors.department && 
											<Form.Control.Feedback type="invalid"  className="d-flex">
												Campo requirdo
											</Form.Control.Feedback>
										}
									</Form.Group>
								</Col>
								<Col
									md={6}
								>
									<Form.Group controlId="township">
										<Form.Label>Municipio</Form.Label>
										<Form.Control 
											name="township" 
											as="select" 
											placeholder="Guatemala" 
											value={id && township }
											onChange={handleChange}
										>
											{townships.length && (<option value="">Seleccione un municipio</option>)}
											{townships.map((el,index) => (
												<option key={index} value={el.id}>{el.name}</option>
											))}
										</Form.Control>
										{errors.township && 
											<Form.Control.Feedback type="invalid"  className="d-flex">
												Campo requirdo
											</Form.Control.Feedback>
										}
									</Form.Group>
								</Col>
								<Col
									md={6}
								>
									<Form.Group controlId="address">
										<Form.Label>Direccion</Form.Label>
										<Form.Control 
											name="address" 
											type="text" 
											placeholder="Zona 1" 
											value={id && address}
											onChange={handleChange}
										/>
										{errors.address && 
											<Form.Control.Feedback type="invalid"  className="d-flex">
												Campo requirdo
											</Form.Control.Feedback>
										}
									</Form.Group>
								</Col>
							</Row>
						</Modal.Body>
						<Modal.Footer>
							<Button variant="secondary" onClick={handleClose}>
								Close
							</Button>
							{id ? (
								<Button variant="primary" type="submit">
									Actualizar datos
								</Button>
							) : (
								<Button variant="primary" type="submit">
									Crear cliente
								</Button>
							)}
						</Modal.Footer>
				</Form>
			</Modal>

			<Modal 
				show={showDelete} 
				onHide={() => setShowDelete(!showDelete)} 
				size="md"
				aria-labelledby="contained-modal-title-vcenter"
				centered
			>
				<Modal.Header closeButton>
					<Modal.Title>Eliminar cliente</Modal.Title>
				</Modal.Header>
				<Modal.Body>Esta seguro de querer eliminar este cliente ?</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={() => setShowDelete(!showDelete)}>
						Cerrar
					</Button>
					<Button variant="danger" onClick={handleDeleteClient}>
						Eliminar
					</Button>
				</Modal.Footer>
			</Modal>
		</>       
	)
}