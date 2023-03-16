describe('Home page', () => {
  it('successfully loads', () => {
    cy.visit('/')
  })

  it('there is a product list', () => {
    cy.get(".products article").should("be.visible");
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})

