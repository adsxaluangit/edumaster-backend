
module.exports = {
  routes: [
    {
      method: 'POST',
      path: '/auth/test-login',
      handler: 'auth-test.login',
      config: {
        auth: false,
      },
    },
  ],
};
