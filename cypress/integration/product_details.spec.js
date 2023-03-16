describe('product details', () => {
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

  it("should have the product description", () => {
    cy.get("p").should("contain", "The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.");
  });

  it("should have the product quantity", () => {
    cy.get(".quantity > span:first").should("contain", "in stock at");
  });

  it("should have the product image", () => {
    cy.get("img").should("be.visible");
  });

  it("should have the product price", () => {
    cy.get(".quantity > span:last").should("contain", "$24.99");
  });

  it("should have the product add to cart button", () => {
    cy.contains('button', 'Add').should("be.visible");
  });
})