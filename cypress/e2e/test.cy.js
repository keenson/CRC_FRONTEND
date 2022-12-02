describe('response status is 200', () => {
    it('GET', () => {
        cy.request('GET', 'https://0tccbk0gn8.execute-api.us-east-1.amazonaws.com/')
        .then((res) => {expect(res).to.have.property('status', 200)
        }) 
        
 
    })
})