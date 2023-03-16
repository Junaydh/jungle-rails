describe('add to cart', () => {
  it('successfully loads', () => {
    cy.visit('/')
  })

  it('there is a product list', () => {
    cy.get(".products article").should("be.visible");
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("There is a product with the name 'Scented Blade'", () => {
    cy.get(".products article").should("contain", "Scented Blade");
  });

  it("should click on the product", () => {
    cy.get(".products article").first().click();
  });

  it("should be on the product page", () => {
    cy.url().should("include", "/products/");
  });

  it("should have the product name in the header", () => {
    cy.get("h1").should("contain", "Scented Blade");
  });

  it("should have the product add to cart button", () => {
    cy.contains('button', 'Add').should("be.visible");
  });

  it('should click on the add to cart button', () => {
    cy.contains('button', 'Add').click();
  });

  it('should increase cart by 1', () => {
    cy.get(".navbar-nav > li").contains('My Cart').should("contain", "My Cart (1)");
  });
})