describe('response status is 200', () => {
    it('GET', () => {
        cy.request('GET', 'https://google.com')
        .then((res) => {expect(res).to.have.property('status', 200)
        }) 
        
 
    })
})