import axios from 'axios'

const key = 'my-secret-toke'

export const setToken = (token) => {
    localStorage.setItem(key, token)
}

export const getToken = () => {
    return localStorage.getItem(key)
}

export const deleteToken = () => {
    localStorage.removeItem(key)
}

export const initAxios = () => {
    const url = '/api'
    
    axios.defaults.baseURL = url

    axios.interceptors.request.use((config) => {
        const token = getToken()

        if(token) {
            config.headers.Authorization = 'Bearer '+ token
        }
        //console.log(config)
        return config
    })

    axios.interceptors.response.use(
        function (response) {
            return response
        },
        function (error) {
            console.log(error)
            if(error.response.status == 401){
                //deleteToken()
                //window.location = "/"
            }else {
                return Promise.reject(error)
            }
        }
    )
}