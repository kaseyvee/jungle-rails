describe('Home Page', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it('displays homepage', () => {
    cy.get('h2')
      .should('have.text', 'We got plants and thangs!')
  });

  it("There are products on the page", () => {
    cy.get(".products article")
      .should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article")
      .should("have.length", 2);
  });
})