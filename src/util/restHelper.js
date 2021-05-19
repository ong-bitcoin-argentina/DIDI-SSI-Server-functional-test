const axios = require('axios');

const getData = (url) => {
    try {
        return axios.get(url, { headers: {
            'User-Agent':
              "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36",
            'Connection': 'keep-alive',
            'Accept-Encoding': 'gzip, deflate, br',
            'Access-Control-Allow-Origin': '*'
          } });
    } catch (e) {
        console.error('exception occurred while GET', e);
        throw e;
    }
}

const postData = (url, data) => {
    try {
        return axios.post(url, data);
    } catch (e) {
        console.error('exception occurred while POST', e);
        throw e;
    }
}

const patchData = async (url, data) => {
    try {
        return await axios.patch(url, data);
    } catch (e) {
        console.error('exception occurred while PATCH', e);
        throw e;
    }
}

const deleteData = async (url, data) => {
    try {
        return await axios.delete(url, { data: data});
    } catch (e) {
        console.error('exception occurred while DELETE', e);
        throw e;
    }
}

module.exports = {
    getData,
    postData,
    patchData,
    deleteData
}
