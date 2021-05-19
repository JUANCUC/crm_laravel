import React from 'react'
import { Bar } from 'react-chartjs-2'

export const Graph = ({data, title}) => (
	<div className="card rounded-3 shadow p-3 border-0 h-100">
		<Bar
			data={data}             
			options={{
				responsive: true,
				plugins: {
					title: {
						display: true,
						text: title,
						font: {
							size: 20,
							weight: '500'                            
						},
					},
					legend: {
						labels: {
							display: true,				
							font: {
									size: 16
							}
						}
					},
				},
			
			}}
		/>
	</div>
)