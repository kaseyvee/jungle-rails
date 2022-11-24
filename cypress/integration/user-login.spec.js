describe('Product details', () => {
  beforeEach(() => {
    cy.visit('/')
      .get('.navbar-nav')
      .contains('Login')
      .click()
  });

  it("Access login page", () => {
      cy.get('.container h1')
        .should('have.text', 'Login')
  });

  it("Successfully login with correct details", () => {
    cy.get('#email')
      .type('a@a.com')

    cy.get('#password')
      .type('password')

    cy.get('input')
      .last()
      .click()

    cy.get('.navbar-nav')
      .contains('Kasey')
  });

  it("Unsuccessfully login with incorrect details", () => {
    cy.get('#email')
      .type('b@a.com')

    cy.get('#password')
      .type('password')

    cy.get('input')
      .last()
      .click()

    cy.get('.container h1')
      .should('have.text', 'Login')
  });
})