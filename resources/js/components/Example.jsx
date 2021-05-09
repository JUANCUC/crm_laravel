import React, { useState } from 'react';
import ReactDOM from 'react-dom';


function Example() {
    
    const [count, setCount] = useState(0)

    const handleButton = () => {
        const newValue = count + 1
        setCount(newValue)
    }

    return (
        <div className="container">
            <div className="row justify-content-center">
                <div className="col-md-8">
                    <div className="card">
                        <div className="card-header">Example Component</div>

                        <div className="card-body">I'm an example component!</div>
                        <button onClick={handleButton}>Press me!</button>
                        <p>Contador {count}</p>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Example;

if (document.getElementById('app')) {
    ReactDOM.render(<Example />, document.getElementById('app'));
}
