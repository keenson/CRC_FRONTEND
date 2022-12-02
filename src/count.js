

window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
    });
    
    
    const apiGateway = 'https://0h8zc5wfl1.execute-api.us-east-1.amazonaws.com/';
    
    const getVisitCount = () => {
    let count = 1;
    //   fetch(apiGateway)
    //     .then(response => {
    //       return response.json()
    //     })
    //     .then(response => {
    //       count = response;
        console.log("You are visitor number - " + count);
    //       document.getElementById('visitorCount').innerText = count;
    //     }).catch(function (error) {
    //       console.log(error);
    //     });
    //   return count;
    } 