
'use strict';

module.exports = {
  async login(ctx) {
    const { identifier, password } = ctx.request.body;

    if (!identifier || !password) {
      return ctx.badRequest('Missing identifier or password');
    }

    console.log(`--- [AUTH TEST-LOGIN] ---`);
    console.log(`Identifier: ${identifier}`);

    try {
      const user = await strapi.query('plugin::users-permissions.user').findOne({
        where: {
          $or: [
            { username: identifier },
            { email: identifier.toLowerCase() },
          ],
        },
      });

      if (!user) {
        console.log(`User not found: ${identifier}`);
        return ctx.badRequest('User not found');
      }

      console.log(`User found: ${user.username} (ID: ${user.id})`);
      console.log(`User confirmed: ${user.confirmed}`);
      console.log(`User blocked: ${user.blocked}`);

      const validPassword = await strapi.service('plugin::users-permissions.user').validatePassword(
        password,
        user.password
      );

      if (!validPassword) {
        console.log(`Invalid password for: ${identifier}`);
        return ctx.badRequest('Invalid password');
      }

      console.log(`Login SUCCESS for: ${identifier}`);

      const jwt = strapi.service('plugin::users-permissions.jwt').issue({
        id: user.id,
      });

      return {
        jwt,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
        },
      };
    } catch (err) {
      console.error('Auth test-login error:', err);
      return ctx.badRequest(err.message);
    }
  },
};
