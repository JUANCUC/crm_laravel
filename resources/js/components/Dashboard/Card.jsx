import React from 'react'

export const Card = ({name,icon,quantity,bg}) => (
	<div className="col-md-4 col-lg-2 mb-3">
		<div className={["card results border-0 rounded-3 shadow h-100 justify-content-center p-3", bg].join(' ')}>
			<div className="title">
				<h5 className="text-white mb-2">{name}</h5>
			</div>
			<h3 className=" text-white m-0 mt-auto ">{quantity}</h3>
			<span className="text-white"><i className={icon}></i></span>
		</div>
	</div>
)