import React from 'react'
import ReactDOM from 'react-dom'
import './Dashboard.css'

const arrayCard = [
    {
        name: 'Total clientes',
        icon: 'fa fa-users',
        quantity: 100,
        bg: 'bg-primary'
    },
    {
        name: 'Total Ventas',
        icon: 'fas fa-hand-holding-usd',
        quantity: 'Q 100',
        bg: 'bg-success'
    },
    {
        name: 'Clientes en los ultimos 30 dias',
        icon: 'fas fa-user-plus',
        quantity: 100,
        bg: 'bg-warning'
    },
]

export const Dashboard = () => {
    return (
        <>
            <h1 style={{color: 'var(--bg)'}}>Dashboard</h1>
            <div className="row justify-content-start mt-3">
                
                {arrayCard.map((el,index) => (
                    <div key={index} className="col-md-6 col-lg-2 mb-3">
                        <div className={["card border-0 rounded shadows-sm h-100 justify-content-center p-3", el.bg].join(' ')}>
                            <div className="title">
                                <h5 className="text-white mb-2">{el.name}</h5>
                            </div>
                            <h3 className=" text-white m-0 mt-auto ">{el.quantity}</h3>
                            <span className="text-white"><i className={el.icon}></i></span>
                        </div>
                    </div>
                ))}
            </div>
        </>
    )
}

ReactDOM.render(<Dashboard/>, document.getElementById('dashboard'))