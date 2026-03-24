
module.exports = (config, { strapi }) => {
  return async (ctx, next) => {
    if (ctx.url.includes('/auth/local') && ctx.method === 'POST') {
      console.log('--- [DEBUG LOGIN] Incoming Request ---');
      console.log('URL:', ctx.url);
      console.log('Method:', ctx.method);
      console.log('Identifier:', ctx.request.body?.identifier);
      console.log('Password Length:', ctx.request.body?.password?.length);
      // We don't log the full password for security, but we can log if it's there
      console.log('Has Password:', !!ctx.request.body?.password);
    }
    await next();
  };
};
