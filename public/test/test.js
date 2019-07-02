var request = require("supertest"),
  app = require("/src/App.js").getApp;

describe("GET /", () => {
  it("expects HTTP response 200", done => {
    request(app)
      .get("/")
      .expect(200, done);
  });
});
