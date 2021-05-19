import React from 'react'
import { Pie } from 'react-chartjs-2'

export const GraphPie = ({data, title}) => (
	<div className="card rounded-3 shadow p-3 border-0 h-100">
		<Pie
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
                        display: false,
                        position:'right',	
						labels: {
							display: true,	
                            		
							font: {
								size: 14
							}
						}
					},
				},
			
			}}
		/>
	</div>
)