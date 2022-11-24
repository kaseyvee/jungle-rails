describe('Add to cart', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it("Cart should go up by 1 after adding item", () => {
    cy.get('.btn')
      .first()
      .click({force: true})
      .get('.end-0')
      .should('contain', '1')
  });

  it("Cart should stay at 0 after attempted to add sold out item", () => {
    cy.get('.btn')
      .last()
      .click({force: true})
      .get('.end-0')
      .should('contain', '0')
  });

})