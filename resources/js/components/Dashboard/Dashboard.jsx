import React, { useState, useEffect } from 'react'
//import ReactDOM from 'react-dom'
import axios from 'axios'
//import { Bar } from 'react-chartjs-2'

import './Dashboard.css'
import { Graph } from './Graph'
import { GraphPie } from './GraphPie'

import { Card } from './Card'


export const Dashboard = () => {
	
	const [data, setData] = useState({})
	const [dataDepartments, setDataDepartments] = useState(null)
	const [dataYears, setDataYears] = useState(null)
	const [dataMonthYear, setDataMonthYear] = useState(null)
	const [spinner, setSpinner] = useState(true)

	const cards = [
		{
			tag: 'clients',
			name: 'Total clientes',
			icon: 'fa fa-users',
			quantity: (data.clients ? data.clients : 0 ) ,
			bg: 'bg-primary'
		},
		{
			name: 'Total Ventas',
			icon: 'fas fa-hand-holding-usd',
			quantity: `Q ${(data.sales ? data.sales : 0 )}` ,
			bg: 'bg-success'
		},
		{
			name: 'Clientes en los ultimos 30 dias',
			icon: 'fas fa-user-plus',
			quantity: (data.last_30_days_clients ? data.last_30_days_clients : 0 ) ,
			bg: 'bg-warning'
		},
		{
			name: 'Clientes en el ultimo año',
			icon: 'fas fa-user-plus',
			quantity: (data.last_year_clients ? data.last_year_clients : 0 ) ,
			bg: 'bg-info'
		}
	]

	const generateColor = (n) => {
		let colors = []
		let color ='#'
		let symbols = '0123456789ABCDEF'

		for(let i = 0; i < n; i++){
			color = '#'
			for(let j = 0 ; j < 6; j++) {
				color = color + symbols[Math.floor(Math.random() * 16)];
			}
			colors.push(color)
		}

		return colors
	}

	const getData = async () => {
		try {
			const response = await axios.get('/reports-general')
			const data = await response.data
						
			const labelsDepartment = data.departments.map(x => x.name)
			const dataDepartment = data.departments.map(x => x.total)
			
			const labelsYear = data.old_year.map(x => x.rango)
			const dataYear = data.old_year.map(x => x.total)
			
			const labelMonthYear = data.sales_month_year.map(x => x.month)
			const dataMonthYear = data.sales_month_year.map(x => x.total)

			const departments = {
				labels: labelsDepartment,
				datasets: [
					{
						label: 'Clientes por departamento',
						data: dataDepartment,
						backgroundColor: generateColor(labelsDepartment.length),
						//backgroundColor: '#fff',
						barPercentage: 0.5,
						minBarLength: 2,
					}
				]
			}
			const years = {
				labels: labelsYear,
				datasets: [
					{
						label: 'Clientes por rango de edad',
						data: dataYear,
						backgroundColor: generateColor(labelsDepartment.length),
						//backgroundColor: '#fff',
						barPercentage: 0.5,
						minBarLength: 2,
					}
				]
			}

			const month_year = {
				labels: labelMonthYear,
				datasets: [
					{
						label: 'Ventas por mes',
						data: dataMonthYear,
						backgroundColor: generateColor(labelsDepartment.length),
						barPercentage: 0.5,
						minBarLength: 2,
					}
				]
			}

			setData(data)
			setDataDepartments(departments)
			setDataYears(years)
			setDataMonthYear(month_year)
			setSpinner(false)
			console.log(data)
		} catch (err) {
			console.log(err.message)
		}
	}
	
	useEffect(() => {
		getData()
		
	}, [])

	return (
		<>
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
				<>
				<h1 style={{color: 'var(--bg)'}}>Dashboard</h1>
				<div className="row justify-content-start mt-3 mb-2">
					{cards.map((el,index) => (
						<Card key={index} name={el.name} icon={el.icon} quantity={el.quantity} bg={el.bg}/>
					))}
				</div>
				<div className="row">
					<div className="mb-4 col-md-12 col-lg-8 text-white">
						<Graph data={dataDepartments} title="Clientes por departamento" />
					</div>
					<div className="mb-4 col-md-12 col-lg-4 text-white">
						<GraphPie data={dataDepartments} title="Clientes por departamento" />
					</div>
					<div className="mb-4 col-md-12 col-lg-4 text-white">
						<GraphPie data={dataYears} title="Clientes por departamento" />
					</div>
					<div className="mb-4 col-md-12 col-lg-8 text-white">
						<Graph data={dataYears} title="Clientes por rango de edad" />
					</div>
					<div className="mb-4 col-md-12 col-lg-8 text-white">
						<Graph data={dataMonthYear} title="Venta por mes" />
					</div>
					<div className="mb-4 col-md-12 col-lg-4 text-white">
						<GraphPie data={dataMonthYear} title="Clientes por departamento" />
					</div>
				</div>
				</>
			)}
			
		</>
	)
}

//ReactDOM.render(<Dashboard/>, document.getElementById('dashboard'))