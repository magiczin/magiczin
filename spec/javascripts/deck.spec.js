import Deck from 'deck';

describe(Deck, () => {
  it('size', () => {
    expect((new Deck).size).toBe(0);
  });
});
