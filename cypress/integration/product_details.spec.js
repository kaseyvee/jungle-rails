describe('Product details', () => {
  beforeEach(() => {
    cy.visit('/')
    .get('.products article a img')
    .first()
    .click()
  });

  it("Access product details", () => {
      cy.get('.quantity span')
      .should('have.text', '18 in stock at $24.99')
  });

  it("Access have add to cart button", () => {
    cy.get('.price button i')
    .should('have.class', 'fa-shopping-cart')
});
})