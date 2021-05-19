import React, { useState, useEffect } from 'react'
import axios from 'axios'

import { Graph } from './Graph'
import { GraphPie } from './GraphPie'
import { Card } from './Card'

import {
    useParams
} from 'react-router-dom'

import { initAxios } from '../helpers/auth-helper'

initAxios()

export const DashboardClient = () => {
    const { id } = useParams()
    const [data, setData] = useState({})
    const [sales, setSales] = useState(null)
    const [salesDays, setSalesDays] = useState(null)
    const [salesMonths, setSalesMonths] = useState(null)

    const cards = [
		{
			name: 'Total de ventas',
			icon: 'fas fa-hand-holding-usd',
			quantity: `Q ${(sales ? sales : 0 )}` ,
			bg: 'bg-success'
		},
	]

    const getDataClient = async (id) => {
        try {
            const response = await axios.get('/clients/'+id)
            const data = await response.data
            setData(data)
            console.log(data)
        } catch (error) {
            console.log(error.message)
        }
    }

    const getData = async (id) => {
        try {
            const response = await axios.get('/reports-client/'+id)
            const data = await response.data
            
            const labelDays = data.total_last_30_days_sales.map(x => x.day)
            const dataDays = data.total_last_30_days_sales.map(x => x.total)
            
            const days = {
                labels: labelDays,
                datasets: [
                    {
                        label: 'Ventas de los ultimos 30 dias',
                        data: dataDays,
                        backgroundColor: '#29c7ac',
                        
						//backgroundColor: '#fff',
						
                    }
                ]
            }

            const labelMonth = data.total_year_sales.map(x => x.month)
            const dataMonth = data.total_year_sales.map(x => x.total)
            
            const months = {
                labels: labelMonth,
                datasets: [
                    {
                        label: 'Ventas de los ultimos 30 dias',
                        data: dataMonth,
                        backgroundColor: '#241663',
                        
						//backgroundColor: '#fff',
						
                    }
                ]
            }

            setSales(data.total_sales)
            setSalesDays(days)
            setSalesMonths(months)
        } catch (error) {
            
        }
    }

    useEffect(() => {
        getDataClient(id)
        getData(id)
    },[])

    return (
        <>
        <h2>Datos del cliente: {`${data.name} ${data.last_name}`}</h2>
        <div className="row justify-content-start mt-3 mb-2">
				{cards.map((el,index) => (
					<Card key={index} name={el.name} icon={el.icon} quantity={el.quantity} bg={el.bg}/>
				))}
			</div>
        <div className="row">
            <div className="mb-4 col-md-12 col-lg-8 text-white">
                <Graph data={salesDays} title="Ventas en los ultimos 30 dias" />
            </div>
            <div className="mb-4 col-md-12 col-lg-4 text-white">
                <GraphPie data={salesDays} title="Ventas en los ultimos 30 dias" />
            </div>
            <div className="mb-4 col-md-12 col-lg-4 text-white">
                <GraphPie data={salesMonths} title="Ventas del año" />
            </div>
            <div className="mb-4 col-md-12 col-lg-8 text-white">
                <Graph data={salesMonths} title="Ventas del año" />
            </div>
        </div>
        </>
    )

}